//SPDX-License-Identifier: MIT;


pragma solidity ^0.8.18;


contract HelperConfig {
    //Deploy mocks when we are on local anvil,
    //otherwise, we grab the existing address from the live network
    struct NetworkConfig {
        address priceFeed;
    }

    constructor {
        if(block.chainId == 1151) {

        } else if(block.chainId == 343){

        } else {
            
        }
    }

    function getSepoliaEthConfig() public view {

    }

    function getOrCreateAnvilEthConfig() public view {

    }

}