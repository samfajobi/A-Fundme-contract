//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";


contract TestFundMe is Test {
    uint256 number;
    function setUp() external {
        number = 2;

    }

    function testDemo() public {
        assertEq(number, 2);
    }
}