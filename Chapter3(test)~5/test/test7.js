const Simple2 = artifacts.require("Simple2");
const { chai, BN } = require("./setUp");
const { expect } = chai;

contract("Test7", (accounts) => {
  let simpleInstance;
  beforeEach(async () => {
    simpleInstance = await Simple2.new();
  });

  it("Should not have zero address", async () => {
    expect(simpleInstance.address).to.not.equal(0x0);
  });

  it("Should have 1 ether from accounts[0]", async () => {
    await expect(
      web3.eth.sendTransaction({
        from: accounts[0],
        to: simpleInstance.address,
        value: web3.utils.toWei("1", "ether"),
      })
    ).to.be.fulfilled;

    await expect(
      web3.eth.getBalance(simpleInstance.address)
    ).to.eventually.be.bignumber.equal(new BN(web3.utils.toWei("1", "ether")));
  });

  it("Should have 1 ether from accounts[1]", async () => {
    await expect(
      web3.eth.sendTransaction({
        from: accounts[1],
        to: simpleInstance.address,
        value: web3.utils.toWei("1", "ether"),
      })
    ).to.be.fulfilled;

    await expect(
      web3.eth.getBalance(simpleInstance.address)
    ).to.eventually.be.bignumber.equal(new BN(web3.utils.toWei("1", "ether")));
  });
});
