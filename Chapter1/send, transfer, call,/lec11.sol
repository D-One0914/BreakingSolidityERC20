// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec11 {
    /*

    msg.sender 
    -   msg.sender 트랜잭션을 주는 존재

    balance
    - 현재 이더의 잔액 
    - 주소.balance 

    */
   
    function getMsgSender() public view returns(address)  {
        return msg.sender;
    }
    function balance1(address _a) public view returns(uint) {
        return _a.balance;
    }
    function balance2() public view returns(uint) {
        return (msg.sender).balance;
    }

}

/*


    이더 단위 

    wei, gwei, ether 


    1 ether = 10^18 wei => 99 * 10^18
    1 gwei = 10^9 wei









*/