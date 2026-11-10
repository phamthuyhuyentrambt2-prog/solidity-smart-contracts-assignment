// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Ownable {
    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender; 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

contract ProtectedVault is Ownable {
    uint256 private treasure;

    function deposit() public payable {
        treasure += msg.value;
    }

    function withdraw(address payable to, uint256 amt) public onlyOwner {
        require(amt <= address(this).balance, "Insufficient vault balance");
        to.transfer(amt);
    }

    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}