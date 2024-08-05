// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../src/PutinInsultLoot.sol"; // Adjust the path as necessary

contract TestMinting is Test {
    PutinInsultLoot public putinInsultLoot;

    function setUp() public {
        putinInsultLoot = new PutinInsultLoot();
    }

    function testMinting() public {
        // Mint a token with ID 1
        putinInsultLoot.claim(1);

        // Verify the owner of token 1
        assertEq(putinInsultLoot.ownerOf(1), address(this));

        // Verify that minting another token with the same ID fails
        vm.expectRevert("ERC721: token already minted");
        putinInsultLoot.claim(1);
    }

    function testOwnerClaiming() public {
        // Try to claim a token within the owner's reserved range
        putinInsultLoot.ownerClaim(7778);
        assertEq(putinInsultLoot.ownerOf(7778), address(this));
    }

    function testMintingFailsOnInvalidID() public {
        // Try to mint a token with an invalid ID (out of range)
        vm.expectRevert("Token ID invalid");
        putinInsultLoot.claim(0);

        vm.expectRevert("Token ID invalid");
        putinInsultLoot.claim(7778);

        // Invalid ID for owner claim
        vm.expectRevert("Token ID invalid");
        putinInsultLoot.ownerClaim(8001);
    }
}
