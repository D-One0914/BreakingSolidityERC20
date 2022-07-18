// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
/*
enum
    - 사람이 읽을 수 있게 정의한 상수 세트 즉 숫자에 이름을 붙인것 
        - 예시 0 은 TurnOn

    - (uin8 이므로) 0~255개 까지 이름을 붙일 수 있음 
    - 원래 타입이 uint8 이므로 enum -> uint8로 형변환 가능 또는 uint8 -> enum로 형변환 가능

    enum 이넘명 {

        사용하고자 하는 이름, // 0에 이름 지정
        사용하고자 하는 이름, // 1에 이름 지정
        사용하고자 하는 이름, // 2에 이름 지정
    
    }
*/

contract lec20{
    
    enum Light{
        TurnOn, // 0
        TurnOff, // 1
        Repair // 2
    }
    
    Light public lightStatus;
    
    constructor(){
        lightStatus = Light.TurnOff;
    }
    
    event currentStatus(Light _lightStatus, uint _lightStatusInInt);

    function turnOn() public {
        require(lightStatus == Light.TurnOff, "Light Must Be Turned Off!");
        //lightStatus = Light.TurnOn;
        lightStatus = Light(0);
        emit currentStatus(lightStatus, uint(lightStatus));
    } 

    function turnOff() public {
        require(lightStatus == Light.TurnOn, "Light Must Be Turned On!");
        lightStatus = Light.TurnOff;
        emit currentStatus(lightStatus, uint(lightStatus));
    } 

    function rePair() public {
        require(lightStatus == Light.TurnOff, "Light Must Be Turned Off!");
        lightStatus = Light.Repair;
        emit currentStatus(lightStatus, uint(lightStatus));
    } 

    function rePairDone() public {
        require(lightStatus == Light.Repair, "Light Must Be Repaired!");
        lightStatus = Light.TurnOff;
        emit currentStatus(lightStatus, uint(lightStatus));
    } 

}