//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract BDDMarketplace is ReentrancyGuard{
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    address payable owner;

    struct MarketItem {
        address BBDContact;
        uint256 marketItemId;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => MarketItem ) private idToMarketItem; 

    constructor(){
        owner = payable(msg.sender);
    }

    

    
}