//SPDX-License-Identifier: MIT;


pragma solidity ^0.8.18;


contract HelperConfig {
    //Deploy mocks when we are on local anvil,
    //otherwise, we grab the existing address from the live network
    struct NetworkConfig {
        address priceFeed; //ETH/USD price feed address
    }

    constructor {
        if(block.chainId == 1151) {

        } else if(block.chainId == 343){

        } else {

        }
    }

    function getSepoliaEthConfig() public view returns(NetworkConfig memory){
        sepoliaNetworkConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 // ETH / USD
        });
    }

    function getOrCreateAnvilEthConfig() public view returns(NetworkConfig memory){

    }

}