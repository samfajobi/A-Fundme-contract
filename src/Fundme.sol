// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {PriceConverter} from "./PriceConverter.sol";


contract Fundme {
    using PriceConverter for uint256;

    uint256 constant public MINIMUM_USD;

    address[] public funders;
    address public immutable i_owner;
    mapping(address => uint256) public addressToAmount;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized!!!!");
        _;
    }
    
    constructor() {
        owner == msg.sender;
    }

    function getFunds() public payable {

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Not enough, you need to send more Eth");
        funders.push(msg.sender);
        addressToAmount[msg.sender] += msg.value;
    }


    function withdraw() onlyOwner public{
        for(funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[fundexIndex];
            addressToAmount[funder] = 0;
        }
        //reset array
        funders = new address[](0);

        // //transfer
        // payable(msg.sender).transfer(address(this).balance);
        // //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        // //call
        (bool success, ) = msg.sender.call{value: address(this).address}("");
        require(success, "call failed");
    }
}