// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
/*
Interface
interface : 스마트컨트랙 내에서 정의되어야할 필수 요소를 나타냄 (설명서)

1, 함수는 external로 표시
2, enum, structs 가능 
3, 변수, 생성자 불가(constructor X)
*/
interface ItemInfo {
    struct item{
        string name;
        uint256 price;
    }
    function addItemInfo(string memory _name,uint256 _price) external;
    function getItemInfo(uint256 _index) external view returns(item memory);
}

contract lec20 is ItemInfo{
    item[] public itemList; // [itme("name", 100),itme("name2", 10023),itme("name3", 1002) ] 
    function addItemInfo(string memory _name,uint256 _price) public override {
        itemList.push(item(_name,_price));
    }
    function getItemInfo(uint256 _index) public view override returns(item memory) {
        return itemList[_index];
    }
}

