// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";
contract lec19{
    using SafeMath for uint;
    uint public a = 0;
    uint public max = 2**256-1;
    function becomeOverflow(uint _num1,uint _num2) public  {
        a = _num1.add(_num2);
       
    } 
}
