//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "lib/forge-std/src/Script.sol";
import { CommunityChest } from "../src/CommunityChest.sol";
contract DeployCommunityChest is Script {
    function run() public returns (CommunityChest) {
        vm.startBroadcast();
        CommunityChest communityChest = new CommunityChest();
        vm.stopBroadcast();
        return communityChest;
    }

}