// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec3 {
    /*
        저장 공간
        1. sotrage
            영속적인 읽고/쓰기 가능한 저장 공간
            가스 비용 비쌈
            함수의 외부나, 함수가 저장 
        2. memory
            휘발적인 읽고/쓰기 가능한 저장 공간
            함수의 내부에 정의된 변수, 매개변수, 반환값 등이 사용
        3. colladata 
            읽기 가능한 공간
            external의 매개변수에 적용
        4. stack 
            EVM (Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역
            1024Mb 제한


        함수의 모디파이어 : 함수의 행동을 제한 
        pure, view, payable 

        pure: 순수하게 함수안에있는 변수만 사용할 때
        view: 함수 밖에 있는 변수, 함수를 읽어 올 때 


    


    
    */
     
    
    uint public a = 1;
    
    function fun2() public pure returns(uint){
        uint b = 4;
        return b;
    }
    
    function fun1() public view returns(uint) {
        return a;
    }

    function fun3() public returns(uint) {
        a = 3;
        return a;
    }

    function fun4(string memory _str) public pure returns(string memory) {
        return _str;
    }





}