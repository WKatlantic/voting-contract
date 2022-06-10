// const web3 = require("web3");
// const Sugarland = artifacts.require("Sugarland");
// const SugarNFT = artifacts.require("SugarNFT");
// module.exports = async function (deployer) {
  // await deployer.deploy(Sugarland);
  // const SugarlandDeploy = await Sugarland.deployed();
  // console.log("Sugar Token Address", SugarlandDeploy.address)

  // await deployer.deploy(SugarNFT, SugarlandDeploy.address);
  // const SugarNFTDeploy = await SugarNFT.deployed();
  // console.log("Sugar NFT  address", SugarNFTDeploy.address);

// };

const web3 = require("web3");
const VotingFactory = artifacts.require("VotingFactory");
const VotingPoll = artifacts.require("VotingPoll");
module.exports = async function (deployer) {
  await deployer.deploy(VotingFactory);
  const VotingFactoryDeploy = await VotingFactory.deployed();
  console.log("Voting Factory Address", VotingFactoryDeploy.address)

  // await deployer.deploy(VotingPoll, VotingFactoryDeploy.address);
  // const VotingPollDeploy = await VotingPoll.deployed();
  // console.log("Voting Poll  address", VotingPollDeploy.address);

};