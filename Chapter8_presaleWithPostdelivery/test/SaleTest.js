const { expect } = require("chai");
const chai = require("chai");
const BN = web3.utils.BN;
chai.use(require("chai-bn")(BN));

const Erc20Token = artifacts.require("Erc20Token");
const Sale = artifacts.require("Sale");

contract("Sale Test", async (accounts) => {
  let [deployer, buyer, wallet] = accounts;
  const tokenName = "DOne";
  const tokenSymbol = "DO";
  const totalSupply = await web3.utils.toWei("10", "ether");

  let erc20TokenInstance;
  let saleInstance;
  beforeEach(async () => {
    erc20TokenInstance = await Erc20Token.new(
      tokenName,
      tokenSymbol,
      totalSupply
    );

    const hardCap = web3.utils.toWei("1", "ether");

    let openingTime = new Date(2022, 3, 20, 1, 38, 35);
    let closingTime = new Date(2022, 4, 20, 1, 58, 35);

    openingTime = Math.floor(openingTime.getTime() / 1000);
    closingTime = Math.floor(closingTime.getTime() / 1000);

    saleInstance = await Sale.new(
      1,
      wallet,
      erc20TokenInstance.address,
      hardCap,
      openingTime,
      closingTime,
      deployer
    );

    // rate = 1 //1 wei 기준으로   Done 토큰 1 wei 살 수 있다.
    //1 ether (10^18)  -> sale ->1 DOne token (10^18)

    // rate = 10 // 1 wei 기준으로 Done 토큰 10 wei 살 수 있다.
    //1 ether (10^18)  -> sale ->10 DOne token (10^18 * 10)

    // rate = 100 // 1 wei 기준으로 Done 토큰 100 wei 살 수 있다.
    //1 ether (10^18)  -> sale ->100 DOne token (10^18 * 100)
  });

  it("Smart contracts should be deployed", () => {
    expect(erc20TokenInstance.address).to.not.equal(0x0);
    expect(saleInstance.address).to.not.equal(0x0);
  });

  it.only("Buy", async () => {
    await erc20TokenInstance.transfer(
      saleInstance.address,
      web3.utils.toWei("10", "ether"),
      { from: deployer }
    );

    await saleInstance.addMyWhitelist(buyer, { from: deployer });

    let isBuyerInMyWhitelist = await saleInstance.myWhitelist(buyer);
    expect(isBuyerInMyWhitelist).to.be.equal(true);

    await web3.eth.sendTransaction({
      from: buyer,
      to: saleInstance.address,
      value: web3.utils.toWei("1", "ether"),
      gas: 3000000,
    });

    isBuyerInMyWhitelist = await saleInstance.myWhitelist(buyer);
    expect(isBuyerInMyWhitelist).to.be.equal(false);

    const BuyerBalanceOfDoneToken = await erc20TokenInstance.balanceOf(buyer);
    const WalletBalanceOfEther = await web3.eth.getBalance(wallet);

    expect(BuyerBalanceOfDoneToken).to.be.bignumber.equal(
      web3.utils.toWei("1", "ether")
    );
    expect(WalletBalanceOfEther).to.be.bignumber.equal(
      web3.utils.toWei("101", "ether")
    );
  });
});
