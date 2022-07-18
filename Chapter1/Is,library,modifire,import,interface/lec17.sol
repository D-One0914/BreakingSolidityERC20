// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/* modifier 
 함수에 적용을 하여, 함수의 행위를 제한

    1. 매개 변수가 있는 모디파이어 
    modifier 모디파이어 이름(자료형 매개변수이름){
        //모디파이어 로직
        _;
    }
    2.매개 변수가 없는 모디 파이어
    modifier 모디파이어 이름{
       //모디파이어 로직
        _;
        
    }
*/

contract lec17{
    

    
    function BuyCigarette1(uint256 _age) public pure onlyAdults(_age) returns(string memory){
      
        return "Your payment is succeeded";
    }
    
    function BuyCigarette2(uint256 _age) public pure onlyAdults(_age) returns(string memory){
       
        return "Your payment is succeeded";
    }
    
    function BuyCigarette3(uint256 _age) public pure onlyAdults(_age) returns(string memory){
       
        return "Your payment is succeeded";
    }
    
    function BuyCigarette4(uint256 _age) public pure onlyAdults(_age) returns(string memory){
      
        return "Your payment is succeeded";
    }





    /*
        1. 매개 변수가 있는 모디파이어 
    modifier 모디파이어 이름(자료형 매개변수이름){
        //모디파이어 로직
        _;
    }


    */

    modifier onlyAdults(uint256 _age){
        require(_age>20,"You are not allowed to pay for the cigarette");
        _;
    }
    function BuyCigarette5(uint256 _age) public pure onlyAdults(_age) returns(string memory){
        return "Your payment is succeeded";
    }


/*
    2.매개 변수가 없는 모디 파이어
    modifier 모디파이어 이름{
       //모디파이어 로직
        _;
        
    }

*/
    uint256 public num = 5;
    modifier numChange{
        _;
        num = 10;
        
        
    }
    function numChangeFunction() public numChange{
        num = 15;
    }
}