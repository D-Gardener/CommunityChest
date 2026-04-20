//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "lib/forge-std/src/Test.sol";
import { DeployCommunityChest } from "../script/DeployCommunityChest.s.sol";

contract CommunityChestTest is Test {
    function setup() public {
        DeployCommunityChest deployer = new DeployCommunityChest();
        deployer.run();
    }
}