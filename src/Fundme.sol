// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {PriceConverter} from "./PriceConverter.sol";


contract Fundme {
    using PriceConverter for uint256;

    uint256 public MINIMUM_USD;

    address[] public funders;
    mapping(address => uint256) public addressToAmount;

    function getFunds() public payable {

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Not enough, you need to send more Eth");
        funders.push(msg.sender);
        addressToAmount[msg.sender] += msg.value;
    }


    function withdraw() public view returns(uint256){

    }
}