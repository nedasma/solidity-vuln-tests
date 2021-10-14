// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

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
        require(state == State.Vacant, "The room is occupied!");
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount, "Insufficient funds!");
        _;
    }
    
    // Double-spend vulnerability due to two functions doing the same thing without protection
    // Also, the second function does not check if the room is already occupied
    
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
