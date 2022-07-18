// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec1 {
    /*
        변수 : 값을 지속적으로 변경 할 수 있음.
        상수 : 한번 넣은 값은 변경 불가.

        자료형 가시성 지정자 변수명 = 값
        uint public a = 3;
        a=4;

        uint public constant b=3;
        b=4 

        자료형 타입
        값 타입 Vs 참조 타입

        값 타입 : uint, int, bool , address (고정 길이), bytes1...bytes32 (고정 길이)
        참조 타입 : bytes(동적 길이),string (동적 길이), array(배열), mapping (매핑), struct (구조체) 
        
        int : 기호있는 integer 
        int8 : -2^7 ~ 2^7-1
        int16: -2^15~2^15-1
        int32: -2^31~2^31-1
        int64: -2^63~2^63-1
        int128 : -2^127~2^127-1
        int256 (=int): -2^255~2^255-1

        uint:  기호없는 integer 
        uint8 : 0~2^8-1
        uint16: -0~2^16-1
        uint32: -0~2^32-1
        uint64: -0~2^64-1
        uint128 : -0~2^128-1
        uint256 (=uint): 0~2^256-1

        bool : true or false

        산술연산자 : + - * / **
        논리 연산자 : &&, ||
        비교연산자: <,>,!=,==, >= , <=
      
    */
     
    
    uint public a = 1;
    int public b = -1;
    bool public c = true;
    bytes1 public d = hex"11";
    string public e = "abcd";

    //산술 연산자 : +,-,*,/
    uint public f = 1+2;
    uint public g = 3-2;
    uint public h = 4*2;
    uint public i = 4/2;
    uint public j = 4**2;

    //논리 연산자 : &&, ||
    bool public k = true && true; // true
    bool public m = true && false; // false
    bool public n = false && false; //false
    
    bool public l = true || true; // true
    bool public o = true || false; // true
    bool public p = false || false; // false

    // 비교연산자
    bool public q = 3>5; //false
    bool public r = 3<=4; // true
    bool public s = 3==3; // true
    bool public t = 3!=3; // false


    uint public constant z=3; // 상수 
   

}