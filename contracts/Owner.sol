//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// https://www.tutorialspoint.com/solidity/solidity_function_modifiers.htm
contract Owner{
    address owner;
    constructor() public{
        owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    modifier Owned {
        require(owner == msg.sender, 'Error 1');
        _;
    }

    modifier Richer(uint price){
        if(msg.value >= price){
            _;
        }
    }
}