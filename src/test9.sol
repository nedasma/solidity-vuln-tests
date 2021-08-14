// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 <=0.7.0;

contract SimpleStorage {
	uint storedData;
	
	function set(uint x) public {
		storedData = x;
	}
	
	function get(uint _data) public payable {
		msg.sender.transfer(_data);
	}
	
}
contract LockContract {

	function withdraw() public payable {
		uint a; uint b; uint c;
		c = a - b;
		// No withdrawal capacity to payable function - vulnerability
	}
}
