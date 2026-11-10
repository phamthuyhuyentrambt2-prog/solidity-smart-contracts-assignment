// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract VotingSystem {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    struct Voter {
        bool authorized;
        bool voted;
        uint256 voteIndex;
    }

    Candidate[] public candidates;
    mapping(address => Voter) public voters;
    address public chairperson;

    modifier onlyChairperson() {
        require(msg.sender == chairperson, "Not the chairperson");
        _;
    }

    constructor(string[] memory candidateNames) {
        chairperson = msg.sender;
        for (uint256 i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    function authorize(address voter) external onlyChairperson {
        require(!voters[voter].authorized, "Voter already authorized");
        voters[voter].authorized = true;
    }

    function vote(uint256 candidateIndex) external {
        Voter storage sender = voters[msg.sender];
        require(sender.authorized, "Not authorized to vote");
        require(!sender.voted, "Already voted");
        require(candidateIndex < candidates.length, "Invalid candidate index");

        sender.voted = true;
        sender.voteIndex = candidateIndex;
        candidates[candidateIndex].voteCount += 1;
    }

    function totalVotes(uint256 candidateIndex) external view returns (uint256) {
        require(candidateIndex < candidates.length, "Invalid candidate index");
        return candidates[candidateIndex].voteCount;
    }

    function winnerName() external view returns (string memory) {
        require(candidates.length > 0, "No candidates available");
        uint256 winningVoteCount = 0;
        uint256 winningIndex = 0;

        for (uint256 i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > winningVoteCount) {
                winningVoteCount = candidates[i].voteCount;
                winningIndex = i;
            }
        }

        return candidates[winningIndex].name;
    }
}