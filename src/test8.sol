// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.5.0 <=0.7.0;

// tx.origin for authorisation - a vulnerability

contract TestContract {
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function transferTo(address payable dest, uint amount) payable public {
        require(tx.origin == owner);
        dest.transfer(amount);
    }
}
