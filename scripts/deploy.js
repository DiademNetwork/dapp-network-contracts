require('dotenv').config()

const eoslime = require('eoslime').init({
  url: 'https://kylin-dsp-1.liquidapps.io',
  chainId: '5fff1dae8dc8e2fc4d5b23b2c7665c97f9e9d8edf2b6485a86ba311c25639191'
})

const exchangePrivateKey = process.env.EXCHANGE_PRIVATE_KEY

const ESCROW_WASM_PATH = './dnescrow.wasm'
const ESCROW_ABI_PATH = './dnescrow.abi'

const main = async () => {
  console.log('connect escrow')
  const escrowAccount = await eoslime.Account.load('sevenflashdn', exchangePrivateKey)
  
  console.log('connect dappservices')
  const dappservicesAccount = await eoslime.Contract.at('dappservices', escrowAccount)

  console.log('deploy contract')
  try {
    const exchangeContract = await eoslime.Contract.deployOnAccount(ESCROW_WASM_PATH, ESCROW_ABI_PATH, escrowAccount)
  } catch (e) {}
 
  console.log('choose oracle')
  await dappservicesAccount.selectpkg('sevenflashdn', 'heliosselene', 'oracleservic', 'oracleservic')
 
  console.log('stake for oracle')
  await dappservicesAccount.stake('sevenflashdn', 'heliosselene', 'oracleservic', '100.0000 DAPP')
  
  console.log('choose cron')
  await dappservicesAccount.selectpkg('sevenflashdn', 'heliosselene', 'cronservices', 'cronservices')
  
  console.log('stake for cron')
  await dappservicesAccount.stake('sevenflashdn', 'heliosselene', 'cronservices', '100.0000 DAPP')

  console.log('done')
}

main()