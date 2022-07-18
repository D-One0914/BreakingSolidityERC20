/*
Please Read me. 


강의를 따라가다 보면  프리세일 스마트 컨트랙트의 기능이 지속적으로 추가가 됩니다.
그래서, 테스트 코드 역시 기능이 추가된거에 맞게 변화를 줘야합니다.
어느 특정때의 스마트 컨트랙트를 기준으로 테스트 코드를 만들기 애매해서, 간단하게 시간만 테스트 하도록 하겠습니다. 

시간을 변경하는 부분이 핵심이며, 필요한곳에 이용하시면 됩니다. 


1. @openzeppelin/test-helpers 설치
npm i @openzeppelin/test-helpers

2. @openzeppelin/test-helpers에서  time.js 들고오기
const { time } = require("@openzeppelin/test-helpers");

3. 프리세일 시작기간 세팅 
 
//프리세일 시작 시간 : 스마트 컨트랙트 배포하자마 시작.
let openingTime = Math.floor(Date.now() / 1000);
//프리세일 마감 시간 : 시작하고나서 10분후 프리세일 끝남.
let closingTime = openingTime + 3600; // 3600초 = 10분

4. 간단하게 테스트 하기. 

  //isOpen() 함수는 TimeCrowdSale.sol에 있습니다. 
  it.only("프리세일이 시작하고 있어야 한다.", async () => {
    expect(await saleInstance.isOpen()).to.be.equal(true);
  });

  //hasClosed() 함수는 TimeCrowdSale.sol에 있습니다. 
  it.only("프리세일이 끝나 있어야 한다.", async () => {
    await time.increase(3601); //10분 1초 지남
    expect(await saleInstance.hasClosed()).to.be.equal(true);
  });

5. 가나슈를 열고, 테스트 하기.
truffle test --network develop 
(develop은 현재 가나슈로 truffle-config.js로 세팅되어 있음)
*/

//2
/***********************************************************/
const { time } = require("@openzeppelin/test-helpers");
/***********************************************************/
const { expect } = require("chai");
const chai = require("chai");
const BN = web3.utils.BN;
chai.use(require("chai-bn")(BN));

const Erc20Token = artifacts.require("Erc20Token");
const Sale = artifacts.require("Sale");

contract.only("Answer1", async (accounts) => {
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

    //3
    /***********************************************************/
    //프리세일 시작 시간 : 스마트 컨트랙트 배포하자마 시작.
    let openingTime = Math.floor(Date.now() / 1000);
    //프리세일 마감 시간 : 시작하고나서 10분후 프리세일 끝남.
    let closingTime = openingTime + 3600; // 3600초 = 10분
    /***********************************************************/
    saleInstance = await Sale.new(
      1,
      wallet,
      erc20TokenInstance.address,
      hardCap,
      openingTime,
      closingTime,
      deployer
    );
  });

  //4
  /***********************************************************/
  it.only("프리세일이 시작하고 있어야 한다.", async () => {
    expect(await saleInstance.isOpen()).to.be.equal(true);
  });
  it.only("프리세일이 끝나있어야 한다.", async () => {
    await time.increase(3601); //10분 1초 지남
    expect(await saleInstance.hasClosed()).to.be.equal(true);
  });
  /***********************************************************/
});
