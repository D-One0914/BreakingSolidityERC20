// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec6 {
    /*
    구조체(struct)
    자신만의 자료형

    struct 구조체명 {
        자료형 변수명,
        자료형 변수명,
        자료형 변수명
    } 

    struct Human {
        string name;
        uint age;
    }
    */
    struct Human{
        string name;
        uint age;
    }
    mapping(uint256=>Human) public humanMapping;
    Human[] public humanArray;

    function createHuman(string memory _name,uint _age) public pure {
        Human(_name,_age);
    }

    function createHumanInMapping(uint _key,string memory _name,uint _age) public {
        humanMapping[_key] =  Human(_name,_age);
    }
    function createHumanInArray(string memory _name,uint _age) public{
        humanArray.push(Human(_name,_age));
    }
}