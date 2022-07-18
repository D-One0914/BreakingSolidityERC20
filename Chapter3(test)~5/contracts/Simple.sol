// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Simple {

    function return5() public pure returns(uint) {
        return 5;
    }
    
    function returnParameter(uint _num) public pure returns(uint) {
        return _num;
    }
}