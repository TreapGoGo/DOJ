// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Dog {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function woof() external view returns (string memory) {
        return "Woof!";
    }
}

contract DogMaker {
    constructor() {}

    function makeDog() external returns (Dog) {
        string memory name = "puppy";
        Dog dog = new Dog(name);
        return dog;
    }
}
