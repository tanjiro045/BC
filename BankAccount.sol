// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankAccount{
    mapping(address=>uint256) public balances;
    address payable owner;

    constructor()  {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public payable {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        require(amount <= balances[msg.sender],"Insufficient funds.");
        require(amount > 0,"Withdrawal amount must be greater than 0.");
        payable(msg.sender).transfer(amount);
        balances[msg.sender]-=amount;
    }

    function transfer(address payable recipient,uint256 amount) public{
        require(amount <= balances[msg.sender],"Insufficient funds.");
        require(amount > 0,"Withdrawal amount must be greater than 0.");
        balances[msg.sender]-=amount;
        balances[recipient]+=amount;
    }

    function getBalance(address payable user) public view returns (uint256) {
        return balances[user];
    }

    function grantAccess(address payable user) public{
        require(msg.sender == owner,"Only the owner can grant access.");
        owner = user;
    }

    function revokeAccess(address payable user) public{
        require(msg.sender == owner,"Only the owner can revoke access.");
        require(user != owner,"Cannot revoke access for the current owner");
        owner = payable(msg.sender);
    }

    function destroy() public{
        require(msg.sender == owner,"Only the owner can destroy the contract.");
        selfdestruct(owner);
    }

}
