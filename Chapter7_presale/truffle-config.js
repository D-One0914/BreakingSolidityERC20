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
