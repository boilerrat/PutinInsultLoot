// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/PutinInsultLoot.sol"; // Adjust the path as necessary

contract TestInsultGeneration is Test {
    PutinInsultLoot public putinInsultLoot;

    function setUp() public {
        putinInsultLoot = new PutinInsultLoot();
    }

    function testInsultGeneration() public {
        // Mint a token
        putinInsultLoot.claim(1);

        // Fetch the insult for token 1
        string memory insult = putinInsultLoot.getInsult(1);

        // Ensure the insult is not empty
        assert(bytes(insult).length > 0);
    }

    function testDifferentInsults() public {
        // Mint two tokens
        putinInsultLoot.claim(1);
        putinInsultLoot.claim(2);

        // Fetch the insults for both tokens
        string memory insult1 = putinInsultLoot.getInsult(1);
        string memory insult2 = putinInsultLoot.getInsult(2);

        // Ensure the insults are different
        assert(keccak256(bytes(insult1)) != keccak256(bytes(insult2)));
    }

    function testTokenURI() public {
        // Mint a token
        putinInsultLoot.claim(1);

        // Fetch the tokenURI for token 1
        string memory tokenURI = putinInsultLoot.tokenURI(1);

        // Ensure the tokenURI is not empty
        assert(bytes(tokenURI).length > 0);
    }
}
