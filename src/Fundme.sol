// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Fundme {

    uint256 public MINIMUM_USD;

    function getFunds() public payable {

        require(msg.value >= MINIMUM_USD, "Not enough, you need to send more Eth");
    }

    function getPrice() public view returns() {

    }

    function getConversionRate() public view returns() {
        
    }
}