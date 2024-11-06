// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {MoodNFT} from "../src/MoodNFT.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract FlipMood is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNFT", block.chainid);
        flipMood(mostRecentlyDeployed);
    }

    function flipMood(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        MoodNFT(mostRecentlyDeployed).flipMood(0);
        vm.stopBroadcast();
    }
    
}
