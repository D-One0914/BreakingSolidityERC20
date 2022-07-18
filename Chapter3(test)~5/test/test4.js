const Simple2 = artifacts.require("Simple2");
const { chai, BN } = require("./setUp");
const { expect } = chai;

contract("Test4", (accounts) => {
  it("Should not have zero address", async () => {
    const simpleInstance = await Simple2.deployed();
    expect(simpleInstance.address).to.not.equal(0x0);
  });

  it("Should have 1 ether", async () => {
    const simpleInstance = await Simple2.deployed();

    await web3.eth.sendTransaction({
      from: accounts[0],
      to: simpleInstance.address,
      value: web3.utils.toWei("1", "ether"),
    });

    await web3.eth.sendTransaction({
      from: accounts[1],
      to: simpleInstance.address,
      value: web3.utils.toWei("2", "ether"),
    });

    await web3.eth.sendTransaction({
      from: accounts[2],
      to: simpleInstance.address,
      value: web3.utils.toWei("3", "ether"),
    });

    await web3.eth.sendTransaction({
      from: accounts[2],
      to: simpleInstance.address,
      value: web3.utils.toWei("4", "ether"),
    });

    await simpleInstance.return99();

    let info = await simpleInstance.getPastEvents("Receive", {
      filter: { from: accounts[2] },
      fromBlock: 0,
      toBlock: "latest",
    });
    console.log(accounts);
    console.log(info);

    let balance = await web3.eth.getBalance(simpleInstance.address);
    expect(balance).to.be.bignumber.equal(
      new BN(web3.utils.toWei("1", "ether"))
    );
  });
});
