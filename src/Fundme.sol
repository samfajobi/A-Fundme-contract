// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract Fundme {

    uint256 public MINIMUM_USD;

    address[] public funders;

    function getFunds() public payable {

        require(msg.value >= MINIMUM_USD, "Not enough, you need to send more Eth");
        funders.push(msg.sender);
    }

    function getPrice() public view returns() {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethValue) public view returns() {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethValue * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

    function withdraw() public view returns(uint256){

    }
}