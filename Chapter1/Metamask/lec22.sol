// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract lec22 {


    event Transfer(address from, address to, uint amount);
    receive() external payable {
      
    }

    function sendEther() public payable {
        payable(address(this)).transfer(msg.value);
        emit Transfer(msg.sender,address(this),msg.value);
    }


}