// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";


contract TimedCrowdsale  {
    using SafeMath for uint256;

    uint256 private _openingTime;
    uint256 private _closingTime;


    event TimedCrowdsaleExtended(uint256 prevClosingTime, uint256 newClosingTime);


    modifier onlyWhileOpen {
        require(isOpen(), "TimedCrowdsale: not open");
        _;
    }


    constructor (uint256 openingTime_, uint256 closingTime_) {
        // solhint-disable-next-line not-rely-on-time
        //require(openingTime_ >= block.timestamp, "TimedCrowdsale: opening time is before current time");
        // solhint-disable-next-line max-line-length
        require(closingTime_ > openingTime_, "TimedCrowdsale: opening time is not before closing time");

        _openingTime = openingTime_;
        _closingTime = closingTime_;
    }


    function openingTime() public view returns (uint256) {
        return _openingTime;
    }


    function closingTime() public view returns (uint256) {
        return _closingTime;
    }


    function isOpen() public view returns (bool) {
        // solhint-disable-next-line not-rely-on-time
        return block.timestamp >= _openingTime && block.timestamp <= _closingTime;
    }

 
    function hasClosed() public view returns (bool) {
        // solhint-disable-next-line not-rely-on-time
        return block.timestamp > _closingTime;
    }

  
    function _extendTime(uint256 newClosingTime) internal {
        require(!hasClosed(), "TimedCrowdsale: already closed");
        // solhint-disable-next-line max-line-length
        require(newClosingTime > _closingTime, "TimedCrowdsale: new closing time is before current closing time");

        emit TimedCrowdsaleExtended(_closingTime, newClosingTime);
        _closingTime = newClosingTime;
    }
}