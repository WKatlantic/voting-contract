require('dotenv').config();

const HDWalletProvider = require("@truffle/hdwallet-provider");

const mnemonic = process.env.SECRET;
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard BSC port (default: none)
      network_id: "*",       // Any network (default: none)
    },
    testnet: {
      provider: () => new HDWalletProvider(mnemonic, `wss://data-seed-prebsc-1-s1.binance.org:8545`),
      network_id: 97,
      confirmations: 1,
      timeoutBlocks: 50000,
      networkCheckTimeout: 99999,
      skipDryRun: false,
      gas: 5000000,
      gasPrice: 40000000000,
      websocket: true,
    },
    
    bsc: {
      provider: () => new HDWalletProvider(mnemonic, `https://bsc-dataseed1.binance.org`),
      network_id: 56,
      confirmations: 2,
      timeoutBlocks: 5000,
      networkCheckTimeout: 9999,
      skipDryRun: true,
      
    },
    ropsten: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/be0a123d3e494bc28708d61034424f92")
      },
      network_id: 3,
      gas: 8000000      //make sure this gas allocation isn't over 4M, which is the max
    }

  },
  compilers: {
    solc: {
      version: '0.8.7',
    },
  },
  plugins: [
    'truffle-plugin-verify'
  ],
  api_keys: {
    bscscan: "JZ4J2AWVAU7UIIHXB5H39QZFDEUPGVDIJY"
  }
};
