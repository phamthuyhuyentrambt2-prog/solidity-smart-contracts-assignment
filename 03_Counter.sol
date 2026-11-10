// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Counter {
    uint256 public count;
    uint256 public constant MAX = 100; // Giới hạn tối đa

    // Khai báo các Events theo yêu cầu đề bài
    event Incremented(address indexed sender, uint256 newCount);
    event Decremented(address indexed sender, uint256 newCount);
    event Reset(address indexed sender);

    constructor(uint256 _initialCount) {
        require(_initialCount <= MAX, "Initial count exceeds MAX");
        count = _initialCount;
    }

    // Hàm tăng, giới hạn đến 100 và phát sinh sự kiện[cite: 8]
    function increment() public {
        require(count < MAX, "Max limit reached");
        count += 1;
        emit Incremented(msg.sender, count);
    }

    // Hàm giảm, giới hạn về 0 và phát sinh sự kiện[cite: 8]
    function decrement() public {
        require(count > 0, "Count is zero");
        count -= 1;
        emit Decremented(msg.sender, count);
    }

    // Hàm reset về 0 thông qua gọi tường minh[cite: 8]
    function reset() public {
        count = 0;
        emit Reset(msg.sender);
    }

    // Hàm đọc giá trị hiện tại
    function getCount() public view returns (uint256) {
        return count;
    }
}