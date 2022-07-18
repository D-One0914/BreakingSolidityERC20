// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Simple4 {

    uint public num;
    event FromWho(address indexed from, uint value);
    receive() external payable {

    }

    function Setnum(uint _num) public {
        num = _num;
    }

    function Setnum2(uint _num) public payable {
        require( 1 ether == msg.value, "Must Be 1 ether");
        num = _num;
        emit FromWho(msg.sender, msg.value);
    }

}