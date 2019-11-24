#include <eosio/eosio.hpp>
#include <eosio/asset.hpp>
#include <eosio/transaction.hpp>
#include <eosio.token.hpp>

#include "dappservices/oracle.hpp"
#include "dappservices/cron.hpp"

using namespace eosio;
using std::string;
using std::vector;

#define DAPPSERVICE_ACTIONS_COMMANDS() \
  ORACLE_SVC_COMMANDS() \
  CRON_SVC_COMMANDS()

// smart contract for conditional payments
CONTRACT dnescrow : public contract {
  public:
    using contract::contract;
    dnescrow(name receiver, name code, datastream<const char*> ds):contract(receiver, code, ds)
    {}
    
  ACTION init(vector<char>  uri,
              vector<char>  expected,
              name          beneficiary,
              uint64_t      delay_sec);

  ACTION transfer(name    from,
                  name    to,
                  asset   quantity,
                  string  memo);

  bool timer_callback(name        timer,
                      vector<char> payload,
                      uint32_t     seconds);

  XSIGNAL_DAPPSERVICE_ACTION
  ORACLE_DAPPSERVICE_ACTIONS
  CRON_DAPPSERVICE_ACTIONS

  TABLE payment {
    name creator;
    name beneficiary;
    asset quantity;
    uint64_t delay_sec;
    vector<char> uri;
    vector<char> expected;
    bool active;
  };

  typedef eosio::singleton<"escrow"_n, payment> payment_table;

  private:
};

EOSIO_DISPATCH_SVC_TRX(dnescrow, (init))