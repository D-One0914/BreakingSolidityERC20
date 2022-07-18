// SPDX-License-Identifier: GPL-3.0

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

pragma solidity >=0.7.0 <0.9.0;


contract myToken is ERC20 {

    constructor(string memory _name, string memory _symbol, uint _totalSupply) ERC20(_name,_symbol){
        _mint(msg.sender,_totalSupply * 10**18);
    }

}
/*
transfer 

A -> B : 10 토큰 

transferFrom

A -> B : 10 토큰 

C -> 대리 송금 (A -> B : 10 토큰)

A -> C : 10 토큰 
*/