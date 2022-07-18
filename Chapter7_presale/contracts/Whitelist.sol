// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";
contract Whitelist is Ownable {

    mapping(address => bool) public myWhitelist;

    modifier isMywhitelisted(address _addr) {
        require(myWhitelist[_addr], "WhitelistCrowdsale: beneficiary doesn't have the Whitelisted role");
        _;
    }

    function addMyWhitelist(address _addr) public onlyOwner() {
        myWhitelist[_addr] = true;
    }
 
    function addMyWhitelist2(address[] memory _addr) public onlyOwner() {
         
        for(uint index = 0; index< _addr.length; index++) {
              myWhitelist[_addr[index]] = true;
        }
      
    }

    function _removeMyWhitelist(address _addr) internal {
        myWhitelist[_addr] = false;
    } 
    function removeMyWhitelist(address _addr) public onlyOwner(){
        _removeMyWhitelist(_addr);
    }

}