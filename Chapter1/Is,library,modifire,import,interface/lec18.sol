// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
library:  기존에 만들던 스마트 컨트랙과 다른 종류의 스마트 컨트랙

    장점
        - 가스 소비 줄임 : 라이브러리는 재사용가능 한 코드 ( 배포를 할 필요가 없기에)
        - 재사용 : 다른 스마트 컨트랙들에 적용가능
        - 데이터 타입 적용: 라이브러리의 기능들은 데이터 타입에 적용할 수 있기에, 좀 더 쉽게 사용

    단점 
        - fallback 함수 불가
        - 상속 불가
        - payable 함수 정의 불가
    
    0.8 이전 overflow revert
    overflow: 0~255 -> 256 -> 0
    uint8 : 0 ~ 255 ; 255 + 2 = 1  
*/

library SafeMath{
    function add(uint8 a, uint8 b) internal pure returns (uint8) {
        require(a+b >= a , "SafeMath: addition overflow");
        return a + b;
    }
}

contract lec18{
    
    using SafeMath for uint8;
    uint8 public a; 
    
    function becomeOverflow(uint8 _num1,uint8 _num2) public  {
        a = _num1.add(_num2);
        //a = SafeMath.add(_num1 ,_num2);
       
    } 
}

