// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract Wallet {
    address public owner;
    
    /*
    * Payable keyword is used in a constractor only to use Remix initial funding mechanism
    */
    constructor(address _owner) payable {
        owner = _owner;
    }
    
    function deposit() payable external {}
    
    function send(address payable to, uint amount) external {
        require(msg.sender == owner, "Only authorized sender can send amout from contract");
        to.transfer(amount);
    }
    
    function balanceOf() view external returns(uint) {
        return address(this).balance; // 1 Wei = 10^(-18) Ether
    }
    
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
    
    event Received(address _sender, uint _value);
}
