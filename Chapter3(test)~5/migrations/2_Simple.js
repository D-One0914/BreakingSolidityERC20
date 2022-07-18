const Simple = artifacts.require("Simple");
const Simple4 = artifacts.require("Simple4");
module.exports = async function (deployer) {
  await deployer.deploy(Simple);
  await deployer.deploy(Simple4);
};
