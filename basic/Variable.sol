// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Variable{
    // State Variables

    // integer
    int256 public myInt = -1; // can be negative number
    uint public myUint = 1; // uint = uint256
    uint256 public myUint256 = 1;
    uint8 public myUint8 = 1;

    // string
    string public myString = "Hello world";
    bytes32 public myBytes32 = "Hello world";

    // address
    address public myAddress = 0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47;

    // struct = datatype
    struct MyStruct{
        uint256 myUint256;
        string myString;
    }

    MyStruct public myStruct = MyStruct(1,"Hello World");

    // Local Variables
    function getValue() public pure returns(uint){
        uint value = 1; // local variable
        return value;
    }
} 
