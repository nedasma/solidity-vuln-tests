// SPDX-License-Identifier: GPL-3.0

pragma solidity <=0.7.0;

// Adapted for Solidity v. 0.4.17 to run Oyente properly
contract Booking {
    
    enum State {Vacant, Occupied}
    State public state;
    
    address public owner;
    
    event Booked(address _occupant, uint _amount);
   
    function Booking() public {
        owner = msg.sender;
        state = State.Vacant;
    }
    
    modifier onlyIfVacant {
        require(state == State.Vacant);
        _;
    }
    
    modifier costs(uint _amount) {
        require(msg.value >= _amount);
        _;
    }
    
    // Double-spend vulnerability due to two functions doing the same thing without protection
    // Also, the second function does not check if the room is already occupied
    
    function book() public payable onlyIfVacant costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        Booked(msg.sender, msg.value);
    }
    
    function receive() external payable costs(3 ether) {
        owner.transfer(msg.value);
        state = State.Occupied;
        Booked(msg.sender, msg.value);
    }
    
}
