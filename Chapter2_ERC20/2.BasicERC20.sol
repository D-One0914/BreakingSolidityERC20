
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract myToken {

    string private tokenName; // Ether
    string private tokenSymbol; // ETH
    uint private tokenTotalSupply; // 1000
    uint private tokenDecimal; // 1 ether = 10 ^18 wei =>18

    constructor(string memory _name, string memory _symbol, uint _totalSupply, uint _decimal) {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenTotalSupply = _totalSupply;
        tokenDecimal = _decimal;
    }

    function name() public view returns(string memory) {
        return tokenName;
    }

    function symbol() public view returns(string memory) {
        return tokenSymbol;
    }

    function totalSupply() public view returns(uint) {
        return tokenTotalSupply;
    }

    function decimal() public view returns(uint) {
        return tokenDecimal;
    }
}


