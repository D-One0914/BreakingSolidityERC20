var Migrations = artifacts.require("./Migrations.sol");
var Ex = artifacts.require("./Ex.sol");
module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Ex);
};
