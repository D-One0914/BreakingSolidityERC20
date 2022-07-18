const Simple = artifacts.require("Simple");
const { chai, BN } = require("./setUp");
const { expect } = chai;

contract("Test2", (account) => {
  it("Should not have zero address", async () => {
    const simpleInstance = await Simple.deployed();
    await expect(simpleInstance.address).to.not.equal(0x0);
  });

  it("Should have 5", async () => {
    const simpleInstance = await Simple.deployed();
    const result = await simpleInstance.return5();
    console.log(new BN(5));
    await expect(result).to.be.bignumber.equal(new BN(5));

    const addNumber = new BN(4).add(new BN(1)); // 4 + 1 = 5
    await expect(result).to.be.bignumber.equal(addNumber);

    const subNumber = new BN(6).sub(new BN(1)); // 6 -1 = 5
    await expect(result).to.be.bignumber.equal(subNumber);

    const mulNumber = new BN(5).mul(new BN(1)); // 5 * 1 = 5
    await expect(result).to.be.bignumber.equal(mulNumber);

    const divNumber = new BN(5).div(new BN(1)); // 5 / 1 = 5
    await expect(result).to.be.bignumber.equal(divNumber);
  });

  it("Should have 55", async () => {
    const simpleInstance = await Simple.deployed();
    const result = await simpleInstance.returnParameter(55);
    await expect(result).to.be.bignumber.equal(new BN(55));
  });
});
