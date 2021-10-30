//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./Owner.sol";



//https://docs.openzeppelin.com/contracts/3.x/erc721 
contract Beyblade is ERC721URIStorage, Owner{
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;
        address contractAddress;

        constructor(address marketplaceAddress) ERC721("Bayblade", "BBD"){
            contractAddress = marketplaceAddress;
        }
        
    

        function MintNewBBD(string memory tokenUri) public Owned returns(uint256) {
            _tokenIds.increment();

            uint256 newItemId = _tokenIds.current();

            _mint(msg.sender, newItemId);
            _setTokenURI(newItemId, tokenUri);

            // prove or remove operator as an operator for the caller. Operators can call transferFrom or safeTransferFrom for any token owned by the caller.
            // https://docs.openzeppelin.com/contracts/3.x/api/token/erc721#IERC721-setApprovalForAll-address-bool-
            setApprovalForAll(contractAddress, true);

            return newItemId;
        }


}
