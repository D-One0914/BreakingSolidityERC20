// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec8 {

    /*
    반복문 for, while, do-while 
        - 특정한 작업을 반복적으로 수행함. 
        - 함수 내부에서만 작동

    for(초기식; 조건식; 증감식;){
        특정 작업
    }

    초기식;
    while(조건식){
        특정 작업
        증감식;
    }

    초기식;
    do{
        특정 작업
        증감식;
    }while(조건식);


    */

    /*

    for(초기식; 조건식; 증감식;){
        특정 작업
    }

    */

    function forFun() public pure returns(uint) {    
        uint total = 0;
        for(uint a = 0; a<2; ++a ){ 
            total = total + a;
        }
        return total;
    }

    /*

    초기식;
    while(조건식){
        특정 작업
        증감식;
    }

    */
    function whileFun() public pure returns(uint) {
        uint total = 0;
        uint a = 0;
        while(a<2){
            total = total + a;
            a++;
        }
        return total;
    }


    /*

    초기식;
    do{
        특정 작업
        증감식;
    }while(조건식);


    */

    function do_whilFun() public pure returns(uint) {
        uint total = 0;
        uint a = 8;
        do{
            total = total + a;
            a++;
        }while(a>10);
        return total;
    }
}