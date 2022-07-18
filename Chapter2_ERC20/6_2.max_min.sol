// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ex6_2 {

    function max() pure public returns (uint) {
        return type(uint256).max;
    }
    function min() pure public returns (uint) {
        return type(uint256).min;
    }

}
