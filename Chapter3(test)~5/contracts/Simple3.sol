// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Simple3 {

    event OnlyTrue(bool resultTrue);
    uint public num;
    uint public deployedTime;
    constructor(uint _num) {
        num = _num;
        deployedTime = block.timestamp;
    }

    function noFalse(bool trueOrFalse) public {
        require(trueOrFalse,"No false!");
        emit OnlyTrue(trueOrFalse);
    }
    function return5() public pure returns(uint) {
        return 5;
    }
    function return5In10mins() public view returns(uint) {
        require(block.timestamp >= deployedTime + 10 minutes, "10 mins is not passed yet!");
        return 5;
    }

}
