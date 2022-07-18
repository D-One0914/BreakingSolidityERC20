const Simple3 = artifacts.require("Simple3");

module.exports = (deployer) => {
  deployer.deploy(Simple3, 55);
};
