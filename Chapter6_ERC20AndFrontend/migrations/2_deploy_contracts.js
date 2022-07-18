const Erc20Token = artifacts.require("Erc20Token");

module.exports = function (deployer) {
  const tokenName = "DOne";
  const tokenSymbol = "DO";
  const totalSupply = 10;
  deployer.deploy(Erc20Token, tokenName, tokenSymbol, totalSupply);
};
