//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Test, console } from "lib/forge-std/src/Test.sol";
import {DeployCommunityChest} from "../../script/DeployCommunityChest.s.sol";
import {CommunityChest} from "../../src/CommunityChest.sol";

contract CommunityChestTest is Test {
    CommunityChest communityChest;
    address public user = makeAddr("user");

    function setUp() public {
        DeployCommunityChest deployer = new DeployCommunityChest();
        communityChest = deployer.run();
        vm.deal(user, 4 ether);
    }

    function testDeployment() public {
        assert(address(communityChest) != address(0));
    }

    function testUnevenDeposit() public {
        vm.prank(user);
        vm.expectRevert();
        communityChest.deposit{value: 1 ether}(0.5 ether);
    }

    function testWithdraw() public {
        vm.prank(user);
        communityChest.deposit{value: 2 ether}(2 ether);

        uint256 initialBalance = user.balance;
        vm.prank(user);
        communityChest.withdraw();
        uint256 finalBalance = user.balance;

        assertEq(finalBalance, initialBalance + 2 ether);
    }
}
