// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract lec12 {
    /*
    이더를 보내는 3가지 
    
    A 잔액 1 ether

    send
    A -----------5 ether---------> B : false 리턴 

    transfer
    A -----------5 ether---------> B
   
    call
    A -----------5 ether---------> B


    1.send : 2300 gas, 성공여부를 true 또는 false로 리턴한다, 주소 타입의 내장 함수
    2.transfer : 2300 gas, 실패시 에러를 발생, 주소 타입의 내장 함수
    3.call : 가변적인 gas, (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
             재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이스탄불 이후 call 사용을 추천

    payable 
    Payable은 이더 송수신 할때 필요한 키워드 
    즉, send, trnafer 이더를 보낼때 주소는 payable이라는 키워드가 필요 
    이 Payable은 주로 함수,주소,생성자에 붙여서 사용 

    call은 payable 필요 없음
    
    msg.value
    msg.value는 송금보낸 이더의 값
  
    */
    event howMuch(uint256 _value);
    
    function sendNow(address payable _to) public payable{
        bool sent = _to.send(msg.value); // return true or false
        require(sent,"Failed to send either");
        emit howMuch(msg.value);
    }
    
    function transferNow(address payable _to) public payable{
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }
    
    function callNow (address  _to) public payable{
        // ~ 0.7
        //(bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        //require(sent,"Failed to send either");
        
        //0.7 ~
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
        
    }

}