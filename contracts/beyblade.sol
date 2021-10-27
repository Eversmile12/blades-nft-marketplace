//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Owner{
    address owner;
    constructor() public {
        owner = msg.sender;
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

contract Beyblade is ERC721URIStorage, Owner{
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;
        address contractAddress;

        constructor(address marketplaceAddress) ERC721("Bayblad", "BBD"){
            contractAddress = marketplaceAddress;
        }
        
    

        function MintNewBBD(string memory tokenUri) public returns(uint256) {
            _tokenIds.increment();

            uint256 newItemId = _tokenIds.current();

            _mint(msg.sender, newItemId);
            _setTokenURI(newItemId, tokenUri);
            setApprovalForAll(contractAddress, true);
            
            return newItemId;
        }


}
