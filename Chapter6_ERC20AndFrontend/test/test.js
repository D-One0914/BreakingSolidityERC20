const { expect } = require("chai");
const chai = require("chai");
const BN = web3.utils.BN;
chai.use(require("chai-bn")(BN));

const Ex = artifacts.require("Ex");

contract("Erc20Token Test", async (accounts) => {
  let ExTokenInstance;

  beforeEach(async () => {
    ExTokenInstance = await Ex.new();
  });

  it("Should be deployed", async () => {
    await ExTokenInstance.deleteArray(0);
    const index0 = await ExTokenInstance.array(0);
    console.log(index0.toString());
    expect(index0).to.not.equal(0);
  });
});
