// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract someContract {
    
    address payable public owner;
    address payable dest;
    address payable somewhere;
    uint amount = 0; uint answer = 15;
    
     constructor() public {
        owner = msg.sender;
    }
    
    function setDest() public {
        dest = msg.sender;
    }
    
    // Code quality vulnerabilities
    
    function doSomething() public payable {
        
        // Tautologies
        if(true) {
            amount = msg.value;
            owner.transfer(amount);
        }
        if(answer < 25) {
            // Arbitrary destinations
            dest.transfer(address(this).balance);
        }

    }
    
    // Lost contracts
    function transferNowhere() public payable {
        somewhere.transfer(msg.value);
    }
    
    // Unprotected self-destruct
    function kill() public{
        selfdestruct(msg.sender);
    }
}
