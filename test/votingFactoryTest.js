const VotingFacory = artifacts.require("VotingFacory");
const VotingPoll = artifacts.require("VotingPoll");

const truffleAssert = require('truffle-assertions');
const assert = require('assert');

require('chai')
    .use(require('chai-as-promised'))
    .should();

const { ethers } = require('ethers');

contract("VotingFactory Contract" , async(accounts) => {
    let votingFactory;
    let votingPol;
    beforeEach(async () => {
        votingFactory = await VotingFactory.deployed();
    });

    it("----------newVotignPoll----------", async () => {
        votingFactory.mint("LochlanJin" , 1 ,["my option1", "my option2","my option3"]);
    });
})
