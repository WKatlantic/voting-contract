// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
pragma experimental ABIEncoderV2;

import "./VotingFactory.sol";

contract VotingPoll {

    struct vote {
        address joiner;
        uint result;
    }
    uint256 joiners;
    mapping(address => uint) multipleCheck;
    address private owner;
    vote[] voteResult;
    string public votingTitle;
    string[] public options;
    bool public votingStatus;

    constructor (address _creater, string memory _title, string[] memory _options) {
        joiners = 0;
        owner = _creater;
        votingTitle = _title;
        options = _options;
        votingStatus = true;
    }

    function getOwner() external view returns(address) {
        return owner;
    }

    function getTitle() external view returns(string memory) {
        return votingTitle;
    }

    function getOptions() external view returns(string[] memory) {
        return options;
    }
    
    function getStatus() external view returns(bool) {
        return votingStatus;
    }

    function getOptionCounts() external view returns(uint) {
        return options.length;
    }

    function getResult() external view returns(vote[] memory) {
        return voteResult;
    }

    function pauseVoting () external {
        require(msg.sender == owner, "You're not owner!");
        require(votingStatus == true, "This voting was finished before.");
        votingStatus = false;
    }

    function voting(uint _value) external {
        require(multipleCheck[msg.sender] == 0 , "Can't join twice in one poll");
        require(votingStatus == true, "This vote is already finished.");
        multipleCheck[msg.sender] = _value;
        vote storage temp = voteResult[joiners];
        temp.joiner = msg.sender;
        temp.result = _value;
        joiners++;
    }
}