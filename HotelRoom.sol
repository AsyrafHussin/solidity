// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether payments
    // Modifiers
    // Visibility
    // Events
    // Enums

    enum Statuses { 
        VACANT, 
        OCCUPIED 
    }
    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Statuses.VACANT;
    }

    modifier onlyWhileVacant{
        // Check status
        require(currentStatus == Statuses.VACANT, "Currently occupied.");
        _;
    }

    modifier costs(uint _amout){
        // Check price
        require(msg.value >= _amout, "Not enough ether provided.");
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether){
        currentStatus = Statuses.OCCUPIED;

        owner.transfer(msg.value);
        (bool send, bytes memory data) = owner.call{value: msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    }
} 
