// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Example {

    address owner;

    struct Counter {
        uint number;
        string title;
        string description;
    }

    Counter counter;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }

    constructor(uint initial_value, string memory title, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, title, description);
    }

    function increment_counter() external onlyOwner {
        counter.number += 1;
    }

    function decrement_counter() external onlyOwner {
        counter.number -= 1;
    }

    function get_counter_value() external view returns(uint) {
        return counter.number;
    }

    function get_counter_description() external view returns(string memory) {
        return counter.description;
    }

    // New function to get the counter title
    function get_counter_title() external view returns(string memory) {
        return counter.title;
    }
}
