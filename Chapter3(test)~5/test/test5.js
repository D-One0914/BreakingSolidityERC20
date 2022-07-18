const Simple2 = artifacts.require("Simple2");
const { chai, BN } = require("./setUp");
const { expect } = chai;

contract("Test5", (accounts) => {
  it("Should not have zero address", async () => {
    const simpleInstance = await Simple2.deployed();
    expect(simpleInstance.address).to.not.equal(0x0);
  });

  it("Should have 1 ether", async () => {
    const simpleInstance = await Simple2.deployed();

    let info = await simpleInstance.return99();

    console.log(info.logs[0].event);
    console.log(info.logs[0].args);

    let info1 = await web3.eth.sendTransaction({
      from: accounts[0],
      to: simpleInstance.address,
      value: web3.utils.toWei("1", "ether"),
    });

    console.log(info1);

    let balance = await web3.eth.getBalance(simpleInstance.address);
    expect(balance).to.be.bignumber.equal(
      new BN(web3.utils.toWei("1", "ether"))
    );
  });
});
