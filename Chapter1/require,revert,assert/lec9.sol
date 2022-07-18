// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.8.0;

contract lec9 {
    /*
    0.4.22~0.7.x 
    에러핸들러 

    assert : gas를 다 소비한후, 특정한 조건에 부합하지 않으면 에러를 발생시킨다.
    assert(조건문)

    revert: 조건없이 에러를 발생시키고, gas를 환불 시켜준다. 
    revert("에러 메세지");

    require: 특정한 조건에 부합하지 않으면 에러를 발생시키고, gas를 환불 시켜준다.
    require(조건문,"에러메세지")
    */

    function assertNow(uint _a) public pure  {
        assert(_a>=5);
    }

    function revertNow(uint _a) public pure {
        if(_a<5){
            revert("Must be more than 5");
        }
    }
    function requireNow(uint _a) public pure {
        require(_a>=5,"Must be more than 5");
    }
}