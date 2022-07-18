// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.6.0;
    /*

    fallback
        이름 그대로 대비책 함수  
    왜 쓰는가 ?
        - 스마트 컨트랙이 이더를 받을 수 있게 한다.
        - 이더 받고 난  후  어떠한 행동을 취하게 할 수 있다. 
        - call함수로 없는 함수가 불려질때, 어떠한 행동을 취하게 할 수 있다. 
        
        0.6 이전 
        function() external payable {
    
        }

    0.6 이후 
    fallback -> fallback과 recieve

    */

contract safe{
    event received(address _from,uint _amount);
    
    function() external payable{
        //2300 제한된 가스 -> 로직을 실행.

        lec14 _lec14 = new lec14();
        emit received(msg.sender, msg.value);
    }

    function checkMybalance() public view returns(uint){
       return address(this).balance;
    }

}  

contract lec14 {

    function sendNow(address payable _to) public payable{
        bool sent = _to.send(msg.value); // return true or false
        require(sent,"Failed to send either");
    }
    
    function transferNow(address payable _to) public payable{
        _to.transfer(msg.value);
    }
    
    function callNow (address  _to) public payable{
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent,"Failed to send either");
        
        //0.7 ~
        // (bool sent, ) = _to.call{value: msg.value}("");
        // require(sent, "Failed to send Ether");
        
    }

    function callWrong (address _safeAddress) public returns(bool,bytes memory) {
        (bool sent,bytes memory outputFromCalledFunction) = _safeAddress.call(
            abi.encodeWithSignature("wrong()")
        );
        require(sent,"failed");
        return(sent,outputFromCalledFunction);
    }

    function callWrong2 (address _safeAddress) public payable returns(bool,bytes memory) {
        (bool sent,bytes memory outputFromCalledFunction) = _safeAddress.call.value(msg.value)(
            abi.encodeWithSignature("wrong()")
        );
        require(sent,"failed");
        return(sent,outputFromCalledFunction);
    }
}