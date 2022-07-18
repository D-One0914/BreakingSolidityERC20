// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract Erc20Token is ERC20 {

    constructor(string memory _name, string memory _symbol, uint _totalSupply) ERC20(_name,_symbol){
        _mint(msg.sender,_totalSupply * 10**18);
    }

}