// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract Test {
    
    address payable public owner;
    uint amount = 0; uint answer = 0;
    
    
    event Success(address _from, uint _amount);
   
    constructor() public {
        owner = msg.sender;
    }
    
    // Dead code vulnerability as functions are not checked by the static analysis tool if they contribute to the final answer
    
    function doSomething() public payable {
        
        amount = msg.value;
        uint val = 2;
        
        answer = doSomethingElse(amount, val);
        
        owner.transfer(amount);
        emit Success(msg.sender, amount);
    }
    
    function doSomethingElse(uint a, uint b) private returns (uint value) {
        uint c = 0; uint res = 0;
        for(uint i = 0; i < b; i++) {
            if(i == 0) {
                c++;
                res += doUselessCalculations(a, b, c);
            }
            else if(a < b) {
                c += a;
                res += doUselessCalculations(b, a, c);
            }
            else {
            	c++;
            	res += doUselessCalculations(c, b, a); 
            }
        }
        return res;
    }
    
    function doUselessCalculations(uint a, uint b, uint c) private returns (uint res) {
        uint someAnswer = 1;
        for(uint i = 1; i <= 1000; i++) {
            someAnswer += mulmod(a, b, addmod(c, c, a));
        }
        for(uint j = 1; j <= 1000; j++) {
            someAnswer += mulmod(a, b, addmod(c, 5, a));
        }
        for(uint k = 1; k <= 1000; k++) {
            someAnswer += mulmod(a, b, addmod(c, 10, a));
        }
        return someAnswer;
    }
    
}
