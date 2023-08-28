// SPDX-License-Identifier: None
pragma solidity ^0.8.0;

import "./TemporalWallet.sol";
//Contract responsible for creating new temporal wallets. It keeps track of the created wallets
contract WalletFactory {
    // key is the wallet's address and the value is the beneficiary's address.
    mapping(address => address) public wallets;

    event TemporalWalletCreated(address indexed wallet, address indexed beneficiary);

    function createTemporalWallet(address beneficiary) external payable{
        TemporalWallet newWallet = new TemporalWallet{value: msg.value}(beneficiary, msg.sender);
        wallets[address(newWallet)] = beneficiary;

        emit TemporalWalletCreated(address(newWallet), beneficiary);
    }
}