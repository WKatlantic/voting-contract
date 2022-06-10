// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./VotingPoll.sol";

contract VotingFactory {
    address[] public allPolls;
    string[] public titles;
    uint pollCounts;
    
    event PollCreated(address deployer, address addr);

    constructor () {
        pollCounts = 0;
    }

    function getAllPolls() external view returns(address[] memory) {
        return allPolls;
    }

    function getTitles() external view returns(string[] memory) {
        return titles;
    }

    function newVotingPoll(string memory _title, string[] memory _options) external returns(address votingPoll) {
        votingPoll = address(new VotingPoll(msg.sender, _title, _options));
        allPolls.push(votingPoll);
        titles.push(_title);
        emit PollCreated(msg.sender, votingPoll);
        return votingPoll;
    }

    function getPollsCount () external view returns(uint256 cnt) {
        return allPolls.length;
    }
}