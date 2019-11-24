#include <dnescrow.hpp>

// initialize escrow contract
void dnescrow::init(vector<char> uri, 
                    vector<char> expected,
                    name beneficiary,
                    uint64_t delay_sec)
{
  payment_table currentdata(get_self(), get_self().value);
  
  check(currentdata.exists(), "no deposit funded");

  payment newdata = currentdata.get();

  check(newdata.quantity > asset(0, newdata.quantity.symbol), "empty deposit");
  
  require_auth(newdata.creator);
 
  newdata.uri = uri;
  newdata.expected = expected;
  newdata.delay_sec = delay_sec;
  newdata.active = true;
  
  currentdata.set(newdata, get_self());

  // LiquidScheduler will execute action after delay
  vector<char> payload;
  schedule_timer(get_self(), payload, delay_sec);
}

// deposit funds to escrow contract
void dnescrow::transfer(name    from,
                        name    to,
                        asset   quantity,
                        string  memo)
{
  if (to != get_self() || from == get_self()) return;
  
  payment_table currentdata(get_self(), get_self().value);
  
  payment newdata;
  
  if(!currentdata.exists()) {
    currentdata.set(newdata, get_self());
  } else {
    newdata = currentdata.get();
  }
  
  check(newdata.active == false, "already processing");

  newdata.creator = from;  
  newdata.quantity += quantity;
  
  currentdata.set(newdata, get_self());
}

// handler that will be executed by LiquidScheduler
bool dnescrow::timer_callback(name timer,
                    vector<char> payload,
                    uint32_t seconds)
{
  payment_table currentdata(get_self(), get_self().value);

  payment newdata = currentdata.get();

  // LiquidOracle will fetch and return data by external uri
  auto result = getURI(newdata.uri, [&](auto& results) {
      check(results.size() > 0, "no results");

      auto ritr = results.begin();
      auto result = ritr->result;

      return result;
  });
  
  string memo("");
  
  if (result == newdata.expected) {
    // transfer deposit to beneficiary
    action(
      permission_level{get_self(), "active"_n},
      "eosio.token"_n, "transfer"_n,
      make_tuple(get_self(), newdata.beneficiary, newdata.quantity, memo)
    ).send();
  } else {
    // refund deposit to creator 
    action(
      permission_level{_self, "active"_n},
      "eosio.token"_n, "transfer"_n,
      make_tuple(get_self(), newdata.creator, newdata.quantity, memo)
    ).send();
  }
  
  newdata.quantity = asset(0, newdata.quantity.symbol);
  newdata.active = false;

  currentdata.set(newdata, _self);

  return false;
}
