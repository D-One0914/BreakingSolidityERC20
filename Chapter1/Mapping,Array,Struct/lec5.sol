// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec5 {
    /*
    매핑 
    - 키와 값으로 구성
    - length(길이) 없음
    - mapping(키 자료형 => 값 자료형) 가시성 지정자 변수명; 
      mapping(uint => uint) public a; 
    */

    // mapping(address => uint) public a; 
    
    // function addMapping(address _key, uint _value) public {
    //     a[_key] = _value;
    // }

    // function getMapping(address _key) public view returns(uint)  {
    //     return a[_key];
    // }

    // function deleteMapping(address _key) public {
    //     delete(a[_key]);
    //     //a[_key]=0;
    // }
    // function ChangeMapping(address _key, uint _value) public {
    //     a[_key] = _value;
    // }




    /*

    배열
    - length(길이) 있음 
    - 자료형[] 가시성 지정자 변수명; 
      uint256[] public b; 

      uint256[10] public ageFixedSizeArray;
      string[] public nameArray = ["Kal","Jhon","Kerri"];

    */
    uint256[] public b; 
    function addArray(uint _value) public {
        b.push(_value); // 0 : 5, 1 : 10
    }
    function getArray(uint _index) public view returns(uint)  {
        return b[_index];
    }

    function ChangeArray(uint _index, uint _value)public{
        b[_index] = _value;
    }

    function deleteArray() public {
        b.pop();
    }
    function DeleteArray2(uint _index)public{
        delete b[_index];
    }
    function getLength() public view returns(uint) {
        return b.length;
    }

}