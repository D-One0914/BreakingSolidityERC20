// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Ex6_1 {

    // uint8 : 0 ~ 255, 255 + 1 => 256 // 
    function noCheck(uint8 a, uint8 b) pure public returns (uint8) {
        unchecked { return a + b; } // underflow or overflow => no check , ~0.8
    }

    function yesChekc(uint8 a, uint8 b) pure public returns (uint8) {
        return a + b; 
    }
}

// uint8 : 0~255 , a : 255 b: 1 => 255 + 1 : 256, 