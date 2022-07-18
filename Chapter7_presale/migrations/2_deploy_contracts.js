const Erc20Token = artifacts.require("Erc20Token");
const Sale = artifacts.require("Sale");

module.exports = async function (deployer, network, accounts) {
  //truffle migrate --reset --network bsct

  const [deployerAddress, buyer1, buyer2, walletAddress, walletAddress2] =
    accounts;
  const tokenName = "DOne";
  const tokenSymbol = "DO";
  const totalSupply = web3.utils.toWei("100", "ether");
  await deployer.deploy(Erc20Token, tokenName, tokenSymbol, totalSupply);
  const erc20TokenInstance = await Erc20Token.deployed();

  const hardCap = web3.utils.toWei("10", "ether");

  let openingTime = new Date(2022, 5, 4, 16, 50, 0);
  let closingTime = new Date(2022, 7, 4, 17, 0, 0);

  openingTime = Math.floor(openingTime.getTime() / 1000);
  closingTime = Math.floor(closingTime.getTime() / 1000);

  await deployer.deploy(
    Sale,
    1,
    walletAddress,
    erc20TokenInstance.address,
    hardCap,
    openingTime,
    closingTime,
    deployerAddress
  );

  const saleInstance = await Sale.deployed();

  await erc20TokenInstance.approve(
    saleInstance.address,
    web3.utils.toWei("10", "ether"),
    { from: deployerAddress }
  );
  // await saleInstance.addMyWhitelist(buyer1, { from: deployerAddress });
  // await saleInstance.addMyWhitelist(buyer2, { from: deployerAddress });
  await saleInstance.addMyWhitelist2([buyer1, buyer2], {
    from: deployerAddress,
  });
};
