// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    // Mapping
    mapping(uint => string) public names;
    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }

    constructor() {
        names[1] = "Asyraf 1";
        names[2] = "Asyraf 2";
        names[3] = "Asyraf 3";
    }

    function addBook(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {
        books[_id] = Book(_title,_author);
    }

    function addmyBook(
        uint _id, 
        string memory _title, 
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title,_author);
    }
}
