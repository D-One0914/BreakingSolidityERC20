// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
 * @title CappedCrowdsale
 * @dev Crowdsale with a limit for total contributions.
 */
contract Cap  {
    using SafeMath for uint256;

    uint256 private cap;


    constructor (uint256 _cap) {
        require(_cap > 0, "CappedCrowdsale: cap is 0");
        cap = _cap;
    }

    /**
     * @return the cap of the crowdsale.
     */
    function getCap() public view returns (uint256) {
        return cap;
    }

}