const { expect } = require("chai");
const chai = require("chai");
const BN = web3.utils.BN;
chai.use(require("chai-bn")(BN));

const Erc20Token = artifacts.require("Erc20Token");

contract("Erc20Token Test", async (accounts) => {
  const tokenName = "DOne";
  const tokenSymbol = "DO";
  const totalSupply = 10;
  let erc20TokenInstance;
  beforeEach(async () => {
    erc20TokenInstance = await Erc20Token.new(
      tokenName,
      tokenSymbol,
      totalSupply
    );
  });

  it("Should be deployed", () => {
    expect(erc20TokenInstance.address).to.not.equal(0x0);
  });

  it("The deployer has 10 tokens", async () => {
    let delployerBalance = await erc20TokenInstance.balanceOf(accounts[0]);
    expect(delployerBalance).to.be.bignumber.equal(
      web3.utils.toWei("10", "ether")
    );
  });

  it("1 token is sent to account1", async () => {
    await erc20TokenInstance.transfer(
      accounts[1],
      web3.utils.toWei("1", "ether"),
      { from: accounts[0] }
    );

    let delployerBalance = await erc20TokenInstance.balanceOf(accounts[0]);
    let account1Balance = await erc20TokenInstance.balanceOf(accounts[1]);

    expect(delployerBalance).to.be.bignumber.equal(
      web3.utils.toWei("9", "ether")
    );
    expect(account1Balance).to.be.bignumber.equal(
      web3.utils.toWei("1", "ether")
    );
  });
});
