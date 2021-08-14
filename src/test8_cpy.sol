// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.5.0;

// tx.origin for authorisation - a vulnerability
// Adapted for Solidity v. 0.4.17 to run Oyente properly
contract TestContract {
    address owner;

    function TestContract() public {
        owner = msg.sender;
    }

    function transferTo(address dest, uint amount) payable public {
        require(tx.origin == owner);
        dest.transfer(amount);
    }
}
