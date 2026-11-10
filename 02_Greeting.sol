// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Greeting {
    string public message;

    // Constructor khởi tạo lời chào ban đầu khi deploy
    constructor(string memory _initialMessage) {
        message = _initialMessage;
    }

    // Hàm cập nhật lời chào mới
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }

    // Hàm đọc lời chào hiện tại
    function getMessage() public view returns (string memory) {
        return message;
    }
}