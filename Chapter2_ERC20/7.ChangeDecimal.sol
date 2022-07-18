// SPDX-License-Identifier: GPL-3.0

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

pragma solidity >=0.7.0 <0.9.0;


contract myToken is ERC20 {

    constructor(string memory _name, string memory _symbol, uint _totalSupply) ERC20(_name,_symbol){
        _mint(msg.sender,_totalSupply * 10**1);
    }

    function decimals() public pure override returns (uint8) { 
        return 1; 
    }

}
// eTH Decimals 18, 10 0000000000000000
// D_One Decimals 1, 10 0 ( = 10 개 D_One)
// D_One Decimals 2, 10 00 ( = 10 개 D_One)
// D_One Decimals 3, 10 000 ( = 10 개 D_One)
