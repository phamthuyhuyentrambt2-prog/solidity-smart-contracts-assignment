// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Lottery {
    address payable[] private players;
    address public manager;
    uint256 public entryFee;
    uint256 public minPlayers;

    event PlayerEntered(address indexed player);
    event WinnerSelected(address indexed winner, uint256 amount);

    modifier onlyManager() {
        require(msg.sender == manager, "Not the manager");
        _;
    }

    constructor(uint256 _entryFee, uint256 _minPlayers) {
        manager = msg.sender;
        entryFee = _entryFee;
        minPlayers = _minPlayers;
    }

    function enter() public payable {
        require(msg.value == entryFee, "Incorrect entry fee");
        require(msg.sender != manager, "Manager cannot enter the lottery");

        players.push(payable(msg.sender));
        emit PlayerEntered(msg.sender);
    }

    function playersCount() public view returns (uint256) {
        return players.length;
    }

    function pickWinner() public onlyManager {
        require(players.length >= minPlayers, "Not enough players");

        uint256 index = uint256(blockhash(block.number - 1)) % players.length;
        address payable winner = players[index];

        uint256 prizePool = address(this).balance;

        delete players;

        (bool success, ) = winner.call{value: prizePool}("");
        require(success, "Transfer to winner failed");

        emit WinnerSelected(winner, prizePool);
    }

    function getPlayers() public view returns (address payable[] memory) {
        return players;
    }
}