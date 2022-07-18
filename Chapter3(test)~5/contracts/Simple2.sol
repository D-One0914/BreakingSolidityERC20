// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Simple2 {
 
    event Receive(address indexed from, uint amount);
    event ReturnNumber(string description);
    
    receive() external payable{
        emit Receive (msg.sender , msg.value);
    }
    function return99() public {
        emit ReturnNumber("This is return99");
    }
}
