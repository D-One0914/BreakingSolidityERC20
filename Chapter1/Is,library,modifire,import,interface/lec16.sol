// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
    /*
    생성자 
        - 스마트 컨트랙트가 배포될 때 제일 먼저 작동하는 함수
        - 스마트 컨트랙트를 배포할 때 마다 특정한 값을 세팅해줄
        contract lec16 {
            constructor(){
            
            }    
        }

    상속
        - 특정 스마트 컨트랙트의 모든 기능을 상속 받음
        - 상속을 주는쪽 부모 스마트 컨트랙트
        - 상속을 받는쪽 자식 스마트 컨트랙트
        contract lec16 is 스마트컨트랙트 명 {
 
        }

    오버라이딩
        - 상속 받은 함수를 변경
        - virtual : 부모 스마트 컨트랙트에 있는 오버라이딩할 함수에 지정 
        - override : 자식 스마트 컨트랙트에 있는 오버라이딩할 함수에 지정 

    인스턴스화 
        - 특정 스마트 컨트랙트를 인스턴스화하여 여러개 사용가능  
    */

contract fathersWallet {
    uint public money;
    constructor (uint _moeny){
        money = _moeny;
    }

    function addMoney(uint _moeny) public{
        money = money + _moeny;
    }
    
    function changeMoney(uint _moeny) public virtual {
        money = _moeny;
    }
    
}


contract son3 {
    fathersWallet wallet1 = new fathersWallet(1000);
    fathersWallet wallet2 = new fathersWallet(10000);
    fathersWallet wallet3 = new fathersWallet(100000);

    function addWalletAll(uint _money1, uint _money2, uint _money3) public{
        wallet1.addMoney(_money1);
        wallet2.addMoney(_money2);
        wallet3.addMoney(_money3);
    }
    function CheckWalletAll() view public returns(uint,uint,uint){
        uint money1 = wallet1.money();
        uint money2 = wallet2.money();
        uint money3 = wallet3.money();
        return(money1,money2,money3);
    }

}

contract son is fathersWallet{
    constructor (uint _moeny) fathersWallet(_moeny){
    }
}

contract son2 is fathersWallet(91000){
    function changeMoney(uint _moeny) public override{
        money = _moeny * 2;
    }
    
  
}