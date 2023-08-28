// SPDX-License-Identifier: None 
pragma solidity ^0.8.0;

//Contract that represents a temporal wallet
contract TemporalWallet {
    address public owner; //Creator of the wallet
    address public beneficiary; //Address to which the funds will be transferred
    bool public active = true;

    constructor(address _beneficiary, address _owner) payable {
        beneficiary = _beneficiary;
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this");
        _;
    }

    modifier isActive() {
        require(active, "Wallet is not active");
        _;
    }

    //Transfer the funds to the beneficiary and deactivate the wallet
    function transferToBeneficiary() external onlyOwner isActive {
        active = false;
        selfdestruct(payable(beneficiary));
    }

    //Gets balance of specified wallet
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
