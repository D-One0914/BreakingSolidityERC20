// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec10 {
    /*
    - 0.8~
    에러핸들러
    - assert의 가스량이 줄음 
    - 솔리디티 다큐멘테이션에 의하면 assert는 오직 내부적 에러 테스트 용도, 불변성 체크 용도로 사용
    - assert가 에러를 발생시키면 Panic(uint256) 이라는 에러타입의 에러를 발생 (try/catch에서 사용)

    */

    function assertNow(uint _a) public pure  {
        assert(_a>=5);
    }
    function revertNow(uint _a) public pure {
        if(_a>=5){
            revert("Must be more than 5");
        }
    }
    function requireNow(uint _a) public pure {
        require(_a>=5,"Must be more than 5");
    }
}