
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract myToken {

    string private tokenName; // Ether
    string private tokenSymbol; // ETH
    uint private tokenTotalSupply; // 1000
    uint private tokenDecimal; // 1 ether = 10 ^18 wei =>18

    mapping(address => uint) private balances;
   
    constructor(string memory _name, string memory _symbol, uint _totalSupply, uint _decimal) {
        tokenName = _name;
        tokenSymbol = _symbol;
        tokenDecimal = _decimal;
        mint(msg.sender,_totalSupply);

       
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

    function balanceOf(address _addr) public view returns(uint) {
        return balances[_addr];
    }

    function mint(address _addr, uint amount) internal virtual {
        balances[_addr] += amount; 
        tokenTotalSupply += amount;
    }
}



