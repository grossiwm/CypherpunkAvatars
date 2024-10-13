// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract CypherpunkAvatars is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;
    uint16 public supply = 5;

    constructor() ERC721("CypherpunkAvatars", "CYPAV") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function createNFT(address to) public onlyOwner() {
        if (tokenCounter <= supply) {
            tokenCounter += 1;
            uint256 newTokenId = tokenCounter;
            _safeMint(to, newTokenId);
        }
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return string(abi.encodePacked(super.tokenURI(tokenId), ".json"));
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://copper-cheap-marlin-143.mypinata.cloud/ipfs/QmTRpJTSDSe15xscfFL39mX2F847h875RDmJWBRhkUNB5e/";
    }
}
