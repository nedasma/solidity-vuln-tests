// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

library VectorSum {
	function sumSolidity(uint[] memory _data) public pure returns (uint sum) {
		for(uint i = 0; i < _data.length; i++) 
			sum += _data[i];
	}
	function sumAsm(uint[] memory _data) public pure returns (uint sum) {
		for(uint i = 0; i < _data.length; i++) {
			assembly {
				sum := add(sum, mload(add(add(_data, 0x20), mul(i, 0x20))))
			}
		}
	}
	function sumPureAsm(uint[] memory _data) public pure returns (uint sum) {
		assembly {
			let len := mload(_data)
			let data := add(_data, 0x20)
			for 
				{ let end := add(data, mul(len, 0x20)) }
				lt(data, end)
				{ data := add(data, 0x20) }
			{
				sum := add(sum, mload(data))
			}
		}
	}
}
