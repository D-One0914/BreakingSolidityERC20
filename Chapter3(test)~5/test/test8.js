const Simple3 = artifacts.require("Simple3");
const {
  BN, // Big Number support
  constants, // Common constants, like the zero address and largest integers
  expectEvent, // Assertions for emitted events
  expectRevert, // Assertions for transactions that should fail
  time,
} = require("@openzeppelin/test-helpers");

const { chai } = require("./setUp");
const { expect } = chai;

contract.only("Test8", (accounts) => {
  let simpleInstance;
  beforeEach(async () => {
    simpleInstance = await Simple3.new(55);
  });

  it("Should not have zero address", async () => {
    expect(simpleInstance.address).to.not.equal(constants.ZERO_ADDRESS);
  });
  it("Should return 5", async () => {
    expect(await simpleInstance.return5()).to.be.bignumber.equal(new BN("5"));
  });

  it("OnlyTrue", async () => {
    let info = await simpleInstance.noFalse(true);
    expectEvent(info, "OnlyTrue", {
      resultTrue: true,
    });
  });

  it("No false!", async () => {
    expectRevert(simpleInstance.noFalse(false), "No false!");
  });

  it.only("should return 5 as 10 mins is passed", async () => {
    await time.increase(3600);
    expect(await simpleInstance.return5In10mins()).to.be.bignumber.equal(
      new BN("5")
    );
  });

  it.only("should not return 5 as  10 mins is not passed yet", async () => {
    expectRevert(
      simpleInstance.return5In10mins(),
      "10 mins is not passed yet!"
    );
  });
});
