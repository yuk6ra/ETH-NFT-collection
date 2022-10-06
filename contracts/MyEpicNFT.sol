// MyEpicNFT.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";


// インポートしたOpenZeppelinのコントラクトを継承する
// 継承したコントラクトのメソッドにアクセスできるようになる
contract MyEpicNFT is ERC721URIStorage {

    //　OpenZeppelinがtokenIdsを簡単に追跡するために提供するライブラリを呼び出す
    using Counters for Counters.Counter;

    // _tokenIdsを初期化(_tokenIds = 0)
    Counters.Counter private _tokenIds;

    // NFT トークンの名前とシンボルを渡します。
    constructor() ERC721 ("Square","SQR") {
        console.log("This is my NFT contracts.");
    }

    // ユーザがNFTを取得するために実行する関数
    function makeAnEpicNFT() public {

       // 現在のtokenIdを取得する
       uint256 newItemId = _tokenIds.current();

       // msg.senderを使って、NFTを送信者にMintする
       _safeMint(msg.sender, newItemId);

       // NFTデータを設定する
       _setTokenURI(
            newItemId,
            "data:application/json;base64,ewogICJuYW1lIjogIkVwaWNOZnRDcmVhdG9yIiwKICAiZGVzY3JpcHRpb24iOiAiVGhlIGhpZ2hseSBhY2NsYWltZWQgc3F1YXJlIGNvbGxlY3Rpb24iLAogICJpbWFnZSI6ICJkYXRhOmltYWdlL3N2Zyt4bWw7YmFzZTY0LFBITjJad29nSUhodGJHNXpQU0pvZEhSd09pOHZkM2QzTG5jekxtOXlaeTh5TURBd0wzTjJaeUlLSUNCd2NtVnpaWEoyWlVGemNHVmpkRkpoZEdsdlBTSjRUV2x1V1UxcGJpQnRaV1YwSWdvZ0lIWnBaWGRDYjNnOUlqQWdNQ0F6TlRBZ016VXdJZ28rQ2lBZ1BITjBlV3hsUGdvZ0lDQWdMbUpoYzJVZ2V3b2dJQ0FnSUNCbWFXeHNPaUIzYUdsMFpUc0tJQ0FnSUNBZ1ptOXVkQzFtWVcxcGJIazZJSE5sY21sbU93b2dJQ0FnSUNCbWIyNTBMWE5wZW1VNklERTBjSGc3Q2lBZ0lDQjlDaUFnUEM5emRIbHNaVDRLSUNBOGNtVmpkQ0IzYVdSMGFEMGlNVEF3SlNJZ2FHVnBaMmgwUFNJeE1EQWxJaUJtYVd4c1BTSmliR0ZqYXlJZ0x6NEtJQ0E4ZEdWNGRBb2dJQ0FnZUQwaU5UQWxJZ29nSUNBZ2VUMGlOVEFsSWdvZ0lDQWdZMnhoYzNNOUltSmhjMlVpQ2lBZ0lDQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElnb2dJQ0FnZEdWNGRDMWhibU5vYjNJOUltMXBaR1JzWlNJS0lDQStDaUFnSUNCRmNHbGpUa1pVQ2lBZ1BDOTBaWGgwUGdvOEwzTjJaejQ9Igp9"
        );

       // NFTがいつ誰に制作されたかを確認する
       console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

       // 次のNFTがmintされるときのカウンターをインクリメントする
       _tokenIds.increment();
    }
}