// SPDX-License-Identifier: GPL-3.0

pragma solidity <=0.7.0;

// Adapted for Solidity v. 0.4.17 to run Oyente properly
contract outOfGas {

    address public owner;
    address public dest;

	uint counter = 0;
    
    function outOfGas() public {
        owner = msg.sender;
    }
    
    function setDest() public {
        dest = msg.sender;
    }
    
    
    // Out of gas vulnerability due to infinite loop
    
    function run() public payable {
        for(uint i = 0; i >= 0; i++) {
            dest.send(msg.value);
            counter++;
        }
    }
    
}
