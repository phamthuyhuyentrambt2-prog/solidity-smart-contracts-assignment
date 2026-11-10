// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TimeLockVault {
    address payable public beneficiary;
    uint256 public unlockTime;

    event Deposited(address indexed from, uint256 amount, uint256 newUnlockTime);
    event Withdrawn(address indexed to, uint256 amount);
    event LockExtended(uint256 newUnlockTime);

    modifier onlyBeneficiary() {
        require(msg.sender == beneficiary, "Not the beneficiary");
        _;
    }

    constructor(address payable _beneficiary, uint256 _lockSeconds) {
        require(_beneficiary != address(0), "Invalid beneficiary address");
        beneficiary = _beneficiary;
        unlockTime = block.timestamp + _lockSeconds;
    }

    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        emit Deposited(msg.sender, msg.value, unlockTime);
    }

    function extendLock(uint256 _extraSeconds) external onlyBeneficiary {
        unlockTime += _extraSeconds;
        emit LockExtended(unlockTime);
    }

    function withdraw() external onlyBeneficiary {
        require(block.timestamp >= unlockTime, "Vault is still locked");

        uint256 amount = address(this).balance;
        require(amount > 0, "No funds in vault");

        (bool success, ) = beneficiary.call{value: amount}("");
        require(success, "ETH transfer failed");

        emit Withdrawn(beneficiary, amount);
    }

    function timeRemaining() external view returns (uint256) {
        if (block.timestamp >= unlockTime) {
            return 0;
        }
        return unlockTime - block.timestamp;
    }
}