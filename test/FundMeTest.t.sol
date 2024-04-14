//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";


contract TestFundMe is Test {
    uint256 number = 1;
    function setUp() external {
        number = 2;

    }

    function testDemo() public view {
        console.log(number);
        console.log("Hello");
        assertEq(number, 2);
    }
}