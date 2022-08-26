// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTMarketplace{

    address public owner; 

    uint public idForSale;
    
    struct itemForSale{
        address contractAddress;
        address seller;
        address buyer;
        uint price;
        uint tokenID;
        bool state;
    }

    mapping(uint => itemForSale) public idToItemForSale;

    constructor(){
        owner = msg.sender;
    }
    function startNFTSale(address _contractAddress,uint _price , uint _tokenID) public{
        IERC721 NFT = IERC721(_contractAddress);
        require(NFT.ownerOf(_tokenID) == msg.sender,"You are not owner of this nft.");
        NFT.transferFrom(msg.sender,address(this),_tokenID);
        idToItemForSale[idForSale] = itemForSale(_contractAddress ,msg.sender , msg.sender, _price,_tokenID,false);
        idForSale+=1;
    }

    function cancelNFTSale(uint ID)public{
        itemForSale memory info = idToItemForSale[ID];
        IERC721 NFT = IERC721(info.contractAddress);
        require(info.seller == msg.sender);
       require(info.state = false);
       NFT.transferFrom(address(this),msg.sender, info.tokenID);
       idToItemForSale[ID] = itemForSale(address(0), address(0) , address(0), 0 ,0 ,true);
    }
    
    function startNFTAuction()public{

    }

    function cancelNFTAuction()public{

    }
    function buyNFT(uint ID)public payable{
    


    }
    function bid()public payable{

    }

    function finishNFTAuction() public{

    }

    function changeOwner()public{

    }
}