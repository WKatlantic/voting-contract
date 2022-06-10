
const VotingFactory = artifacts.require("VotingFactory");
module.exports = async function (deployer) {
  await deployer.deploy(VotingFactory);
  const VotingFactoryDeploy = await VotingFactory.deployed();
};