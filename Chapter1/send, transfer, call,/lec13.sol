// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;
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
             재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천
             외부스마트 컨트랙트 함수 호출 가능 
             (준비물 : 호출하려는 스마트 컨트랙트 주소 + 호출하려는 함수명)

    payable 
    Payable은 이더 송수신 할때 필요한 키워드 
    즉, send, trnafer 이더를 보낼때 주소는 payable이라는 키워드가 필요 
    이 Payable은 주로 함수,주소,생성자에 붙여서 사용 

    call은 payable 필요 없음
    
    msg.value
    msg.value는 송금보낸 이더의 값
  
    */
contract lec13_1{
    function addNumber(uint _num1, uint _num2) public pure returns(uint){
        return _num1 + _num2;
    }
    function whoIsMsgSender() public view returns(address){
        return msg.sender;
    }
}

contract lec13 {
    event howMuch(uint256 _value);
    //1.송금 기능
    
    // ~ 0.7
    //(bool sent, ) = _to.call.gas(1000).value(msg.value)("");
    //require(sent,"Failed");

    //0.7 ~
    function callNow (address payable _to) public payable{
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "failed");
        emit howMuch(msg.value); 
    }

    //2. 외부 스마트 컨트랙 함수 부르기 
    function callAddNumber(address _lec13_1Address, uint _num1,  uint _num2) public returns(bool,bytes memory) {

        (bool sent,bytes memory outputFromCalledFunction) = _lec13_1Address.call(
            abi.encodeWithSignature("addNumber(uint256,uint256)",_num1,_num2)
        );
        require(sent,"failed");
        return(sent,outputFromCalledFunction);
         
    }

    function callWhoIsMsgSender (address _lec13_1Address) public returns(bool,bytes memory) {
        (bool sent,bytes memory outputFromCalledFunction) = _lec13_1Address.call(
            abi.encodeWithSignature("whoIsMsgSender()")
        );
        require(sent,"failed");
        return(sent,outputFromCalledFunction);
    }
}

/*

0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 ->callWhoIsMsgSender (lec13) -> 
whoIsMsgSender (lec13-1) -? 반환 msg.sender

callWhoIsMsgSender (lec13) 함수의 msg.sender = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
whoIsMsgSender (lec13-1) 함수의 msg.sender = lec13의 주소

*/