"use strict";
const chai = require("chai");
const BN = web3.utils.BN;
const chaiAsPromised = require("chai-as-promised");
chai.use(require("chai-bn")(BN));
// chai.use(chaiAsPromised);

module.exports = {
  chai,
  BN,
};
