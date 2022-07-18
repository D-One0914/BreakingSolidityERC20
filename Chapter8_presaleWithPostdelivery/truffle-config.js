const HDWalletProvider = require("@truffle/hdwallet-provider");
const path = require("path");
require("dotenv").config();
console.log(process.env.MNEMONIC);
const mnemonic = process.env.MNEMONIC;

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    //truffle migrate --reset --network
    develop: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
    eth: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          `https://mainnet.infura.io/v3/b9174b4f09af4bb1b7c7da99b83ff2c0`
        ),
      network_id: 1,
      confirmations: 1,
      timeoutBlocks: 100000,
      skipDryRun: true,
    },

    rinkeby: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          `https://rinkeby.infura.io/v3/b9174b4f09af4bb1b7c7da99b83ff2c0`
        ),
      network_id: 4,
      confirmations: 1,
      timeoutBlocks: 100000,
      skipDryRun: true,
    },
    bsct: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          `https://data-seed-prebsc-1-s1.binance.org:8545`
        ),
      network_id: 97,
      confirmations: 1,
      timeoutBlocks: 100000,
      skipDryRun: true,
    },

    bsc: {
      provider: () =>
        new HDWalletProvider(mnemonic, `https://bsc-dataseed1.binance.org`),
      network_id: 56,
      confirmations: 10,
      timeoutBlocks: 100000,
      skipDryRun: true,
    },
  },
  mocha: {
    timeout: 100000,
  },
  compilers: {
    solc: {
      version: "^0.8.0",
    },
  },
};
