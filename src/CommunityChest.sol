//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract CommunityChest {
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit(uint256 amount) public payable {
        require(msg.value == amount);
    }

    function withdraw() public {
        (bool sent, ) = msg.sender.call{ value: address(this).balance }("");
        require(sent);
    }
}