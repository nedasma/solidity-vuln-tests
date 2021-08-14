// SPDX-License-Identifier: GPL-3.0
pragma solidity <0.9.0;

contract Coin {
	address public minter;
	mapping (address => uint) public balances;
	
	event Sent(address from, address to, uint amount);
	// Two constructors - old version (pre 0.5) and new version. Using both can lead to some unexpected results
	// Same as test10.sol, but the old type constructor contains a typo, meaning that the compiler would not recognise it as a candidate to a constructor.
	function coin() public {
		minter = msg.sender;
	}
	constructor() public {
		minter = address(0xdeadbeef);
	}
	
	function mint(address receiver, uint amount) public {
		require(msg.sender == minter);
		require(amount < 1e60);
		balances[receiver] += amount;
	}
	
	function send(address receiver, uint amount) public {
		if (amount > balances[msg.sender])
			revert("Insufficient balance");
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		emit Sent(msg.sender, receiver, amount);
	}
}
