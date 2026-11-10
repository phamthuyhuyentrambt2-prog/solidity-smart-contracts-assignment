// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Crowdfunding {
    address payable public owner;
    uint256 public goal;
    uint256 public deadline;
    uint256 public raised;
    bool public claimed;
    mapping(address => uint256) public contributions;

    event Contributed(address indexed contributor, uint256 amount);
    event FundsClaimed(address indexed owner, uint256 amount);
    event Refunded(address indexed contributor, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(uint256 _goal, uint256 _durationSeconds) {
        owner = payable(msg.sender);
        goal = _goal;
        deadline = block.timestamp + _durationSeconds;
    }

    function contribute() external payable {
        require(block.timestamp < deadline, "Campaign has ended");
        require(msg.value > 0, "Contribution must be greater than 0");

        contributions[msg.sender] += msg.value;
        raised += msg.value;

        emit Contributed(msg.sender, msg.value);
    }

    function getRemainingTime() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        }
        return deadline - block.timestamp;
    }

    function claimFunds() external onlyOwner {
        require(block.timestamp >= deadline, "Campaign is still active");
        require(raised >= goal, "Goal not reached");
        require(!claimed, "Funds already claimed");

        claimed = true;
        uint256 amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");
        require(success, "ETH transfer failed");

        emit FundsClaimed(owner, amount);
    }

    function refund() external {
        require(block.timestamp >= deadline, "Campaign is still active");
        require(raised < goal, "Goal was reached, no refunds");

        uint256 amount = contributions[msg.sender];
        require(amount > 0, "No funds to refund");

        contributions[msg.sender] = 0;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "ETH transfer failed");

        emit Refunded(msg.sender, amount);
    }
}