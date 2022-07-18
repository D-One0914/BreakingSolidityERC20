// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec2 {
    /*
        가시성 지정자 

        가시성 지정자는 변수, 상수, 함수 적용 가능. 

        public : 외부/내부 접근가능 ( 변수 적용시 getter 함수 생성)
        external : 외부 접근만 가능 ( 변수 적용 불가, this 키워드 사용시 내부 접근 가능)    
        private : 내부 접근만 가능 
        internal : 내부 접근만 가능하나, 상속 받은 스마트 컨트랙트는 외부 접근가능



        함수 만들수 있는 경우의 수

         function 함수명() public {
             //로직
         }


        1. 매개변수와 반환값이 없음
        function fun1() public {
            a = 5;
        }

        2. 매개변수는 있지만 반환값이 없음
        function fun2(uint num) public{
            a = num;
        }

        3. 매개변수는 없지만 반환값이 있음
        function fun3() public returns(uint){
            a = 3;
            return a;
        }

        4. 매개변수와 반환값이 있음
        function fun4(uint num) public returns(uint){
            a = a + num;
            return a;
        }
    */
     
    
    uint public a = 1;
     
    function fun1() public {
        a = 5;
    }

    function fun2(uint _num) external {
        a = _num;
    }
    function fun2_1() external {
       this.fun2(5);
    }

    function fun3() private returns(uint) {
        a = 3;
        return a;
    }
    function fun3_1() public returns(uint) {
      return fun3();
    }
    
    function fun4(uint _num) internal returns(uint){
        a = a + _num;
        return a;
    }

    function fun4_1() public returns(uint) {
        return fun4(55);
    }


}