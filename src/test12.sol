// SPDX-License-Identifier: GPL-3.0

pragma solidity <0.9.0;

// Code coverage - test to check if code size affects the performance of static analysis tools

contract Test {
    
    address payable public owner;
    uint amount = 0; uint answer = 0;
    
    
    event Success(address _from, uint _amount);
   
    constructor() public {
        owner = payable(msg.sender);
    }
    
    function doSomething() public payable {
        
        amount = msg.value;
        uint val = 2;
        
        answer = doSomethingElse(amount, val);
        
        owner.transfer(amount);
        emit Success(msg.sender, amount);
    }
    
    function doSomethingElse(uint a, uint b) private pure returns (uint value) {
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
    
    function doUselessCalculations(uint a, uint b, uint c) private pure returns (uint res) {
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
    
    function doUselessCalculations2(uint a, uint b, uint c) private pure returns (uint res) {
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
    
    function doUselessCalculations3(uint a, uint b, uint c) private pure returns (uint res) {
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
    
    function doUselessCalculations4(uint a, uint b, uint c) private pure returns (uint res) {
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
    
    function doUselessCalculations5(uint a, uint b, uint c) private pure returns (uint res) {
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
    
    function doUselessCalculations6(uint a, uint b, uint c) private pure returns (uint res) {
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
    
    function doUselessCalculations7(uint a, uint b, uint c) private pure returns (uint res) {
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

contract Booking {
    
    enum State {Vacant, Occupied}
    State public state;
    
    address payable public owner;
    
    event Booked(address _occupant, uint _amount);
   
    constructor() public {
        owner = payable(msg.sender);
        state = State.Vacant;
    }
    
    modifier onlyIfVacant {
        require(state == State.Vacant, "Room occupied");
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Insufficient funds");
        _;
    }
    
    function book() public payable onlyIfVacant costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        emit Booked(msg.sender, msg.value);
    }
    
    receive() external payable costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        emit Booked(msg.sender, msg.value);
    }
    
}

contract Booking2 {
    
    enum State {Vacant, Occupied}
    State public state;
    
    address payable public owner;
    
    event Booked(address _occupant, uint _amount);
   
    constructor() public {
        owner = payable(msg.sender);
        state = State.Vacant;
    }
    
    modifier onlyIfVacant {
        require(state == State.Vacant, "Room occupied");
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Insufficient funds");
        _;
    }
    
    function book() public payable onlyIfVacant costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        emit Booked(msg.sender, msg.value);
    }
    
    receive() external payable costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        emit Booked(msg.sender, msg.value);
    }
    
}

contract Booking3 {
    
    enum State {Vacant, Occupied}
    State public state;
    
    address payable public owner;
    
    event Booked(address _occupant, uint _amount);
   
    constructor() public {
        owner = payable(msg.sender);
        state = State.Vacant;
    }
    
    modifier onlyIfVacant {
        require(state == State.Vacant, "Room occupied");
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Insufficient funds");
        _;
    }
    
    function book() public payable onlyIfVacant costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        emit Booked(msg.sender, msg.value);
    }
    
    receive() external payable costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        emit Booked(msg.sender, msg.value);
    }
    
}

contract someContract {
    
    address public owner;
    address payable dest;
    address payable somewhere;
    uint amount = 0; uint answer = 15;
    
 	constructor() public {
        owner = msg.sender;
    }
    
    function setDest() public {
        dest = payable(msg.sender);
    }
    
    function doSomething() public payable {
        if(true) {
            amount = msg.value;
            payable(owner).transfer(amount);
        }
        if(answer < 25) {
            dest.transfer(address(this).balance);
        }

    }
    
    function transferNowhere() public payable {
        somewhere.transfer(msg.value);
    }
    
    function kill() public{
        selfdestruct(payable(msg.sender));
    }
}
