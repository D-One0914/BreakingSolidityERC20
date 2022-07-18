// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec7 {
    /*

    조건문 if, else if, else

    - 어떠한 조건을 주어, 조건이 성사되면 조건문 안에 정의된 특정 코드 실행.
    - 조건의 결과값은 불리언 형태로 조건에 해당이 되는지(참 인지) 안 되는지(거짓) 판단이 되어야한다.
    - 함수 내부에서만 작동

    if(조건){
        //특정 코드
    }else if(조건){
    
    }else{
    
    }


    */
    
    function fun1(uint _a) public pure returns(uint) {
        if(_a == 3){
            return 555;
        }
        return 111;
    } 
    
    function fun2(uint _a) public pure returns(uint) {
        if(_a == 3){
            return 555;
        }else{
            return 111;
        }
       
    } 
    
    function fun3(uint _a) public pure returns(uint) {
        if(_a == 3){
            return 555;
        }else if(_a>=5 && _a<11){
            return 999;
        }else{
            return 0;
        }
    } 

    function fun4(uint _a) public pure returns(uint) {
        if(_a == 3){
            return 555;
        }else if(_a>=5 && _a<11){
            return 999;
        }else if(_a == 7){
            return 7;
        }else{
            return 0;
        }
    } 
}