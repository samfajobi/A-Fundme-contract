//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";


contract HelperConfig is  Script {
    //Deploy mocks when we are on local anvil,
    //otherwise, we grab the existing address from the live network
    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_ANSWER = 6e10;

    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; //ETH/USD price feed address
    }

    constructor() {
        if(block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == 1){
            activeNetworkConfig = getMainnetEthConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilEthConfig();
        }
            
        
    }

    function getSepoliaEthConfig() public pure returns(NetworkConfig memory sepoliaNetworkConfig){
        sepoliaNetworkConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 // ETH / USD
        });
    }

     function getMainnetEthConfig() public pure returns(NetworkConfig memory mainnetNetworkConfig){
        mainnetNetworkConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419 // ETH / USD
        });
    }

    function getOrCreateAnvilEthConfig() public  returns(NetworkConfig memory anvilNetworkConfig){

        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_ANSWER
        );
        vm.stopBroadcast();
        anvilNetworkConfig = NetworkConfig(address(mockPriceFeed));




}