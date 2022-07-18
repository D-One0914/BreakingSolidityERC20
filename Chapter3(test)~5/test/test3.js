const Simple2 = artifacts.require("Simple2");
const { chai, BN } = require("./setUp");
const { expect } = chai;

contract("Test3", (accounts) => {
  it("Should not have zero address", async () => {
    const simpleInstance = await Simple2.deployed();
    expect(simpleInstance.address).to.not.equal(0x0);
  });

  it("Should have 1 ether", async () => {
    const simpleInstance = await Simple2.deployed();

    console.log(accounts);

    await web3.eth.sendTransaction({
      from: accounts[0],
      to: simpleInstance.address,
      value: web3.utils.toWei("1", "ether"),
    });

    let balance = await web3.eth.getBalance(simpleInstance.address);
    expect(balance).to.be.bignumber.equal(
      new BN(web3.utils.toWei("1", "ether"))
    );
  });
});
