const WalletFactory = artifacts.require("WalletFactory");
const TemporalWallet = artifacts.require("TemporalWallet");

module.exports = async function (deployer, network, accounts) {
  const owner = accounts[0];
  const beneficiary = accounts[1];
  const initialBalance = web3.utils.toWei('1', 'ether');

  // Deploy the WalletFactory contract
  await deployer.deploy(WalletFactory);

  // Deploy the TemporalWallet contract with parameters
  await deployer.deploy(TemporalWallet, beneficiary, owner, { value: initialBalance });

  // Get the deployed temporal wallet address
  const temporalWalletInstance = await TemporalWallet.deployed();

  // Log information
  console.log(`WalletFactory deployed at: ${WalletFactory.address}`);
  console.log(`TemporalWallet deployed at: ${temporalWalletInstance.address}`);
};
