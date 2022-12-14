// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

/// @title Vending Machine to buy Donut
/// @author Asyraf Hussin
contract VendingMachine {
    address private owner;
    mapping(address => uint) public donutBalances;
    uint public immutable donutPrice;

    // address(this) = address of current contract
    constructor(uint _donutBalance,uint _donutPrice){
        owner = msg.sender;
        donutBalances[address(this)] = _donutBalance;
        donutPrice = _donutPrice; // in gwei; 1 ether = 1000000000
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can restock this machine.");
        _;
    }

    modifier costs(uint _amount){
        require(msg.value >= _amount * donutPrice, "Not enough ether provided.");
        _;
    }

    modifier checkStock(uint _amount){
        require(donutBalances[address(this)] >= _amount, "Not enough donut stock to purchase.");
        _;
    }

    function purchase(uint _amount) public payable costs(_amount) checkStock(_amount){
        donutBalances[address(this)] -= _amount;
    }

    function restock(uint _amount) public onlyOwner {
        donutBalances[address(this)] += _amount; 
    }
}
