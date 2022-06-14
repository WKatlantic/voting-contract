// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./VotingPoll.sol";

contract VotingFactory {
    address[] public allPolls;
    string[] public titles;
    uint pollCounts;

    struct testItem {
        uint id;
        uint amount;
    }

    mapping (address => testItem[]) testList;
    
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

    function inputTest (address _from, testItem[] memory _options) external {
        testItem[] storage temp = testList[_from];
        for(uint i = 0; i < _options.length; i++) {
            temp[i].id = _options[i].id;
            temp[i].amount = _options[i].amount;
        }
    }

    function getTestList (address _from) external returns(testItem[] memory){
        return testList[_from];
    }
}