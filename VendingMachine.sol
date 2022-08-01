// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

contract VendingMachine {
    address public owner;
    mapping(address => uint) public donutBalances;
    uint public immutable donutPrice;


    // address(this) = address of current contract
    constructor(){
        owner = msg.sender;
        donutBalances[address(this)] = 100;
        donutPrice = 1 ether;
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
