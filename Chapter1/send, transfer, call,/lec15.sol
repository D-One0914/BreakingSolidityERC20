// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;
    /*
    0.6 이후 fallback 
    fallback은 recevie 와 fallback 으로 두가지 형태로 나뉘게 되었습니다.
    receive:  순수하게 이더만 받을때 작동 합니다. 
    fallback: 없는 함수를 호출할 때 ,없는 함수를 호출하면서 이더를 보낼 때 작동합니다.
    
    0.6 이후 
    기본형 :  불려진 함수가 특정 스마트 컨트랙이 없을때 fallback 함수가 발동 합니다. 
    fallback() external {
   
    }
    
    receive() external payable{
    
    }

    payable 적용시 : 이더를 받고 나서도 fallaback 함수가 발동합니다. 
    fallback() external payable {
   
    }

    */

contract safe{
    event received(address _from,uint _amount);
    event justFallback(string _str);
   
    fallback() external payable {
        emit justFallback("No function");
    }
    
    receive() external payable{
        // lec15 _lec15 = new lec15();
        emit received(msg.sender, msg.value);
    }

    function checkMybalance() public view returns(uint){
       return address(this).balance;
    }


}  

contract lec15 {

    function sendNow(address payable _to) public payable{
        bool sent = _to.send(msg.value); // return true or false
        require(sent,"Failed to send either");
    }
    
    function transferNow(address payable _to) public payable{
        _to.transfer(msg.value);
    }
    
    function callNow (address payable _to) public payable{
        // ~ 0.7
        // (bool sent, ) = _to.call.value(msg.value)("");
        // require(sent,"Failed to send either");
        
        // 0.7 ~
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");        
    }

    function callWrong (address _safeAddress) public returns(bool,bytes memory) {
        (bool sent,bytes memory outputFromCalledFunction) = _safeAddress.call(
            abi.encodeWithSignature("wrong()")
        );
        require(sent,"failed");
        return(sent,outputFromCalledFunction);
    }

    function callWrong2 (address _safeAddress) public payable returns(bool,bytes memory) {
        (bool sent,bytes memory outputFromCalledFunction) = _safeAddress.call{value :msg.value}(
            abi.encodeWithSignature("wrong()")
        );
        require(sent,"failed");
        return(sent,outputFromCalledFunction);
    }
}