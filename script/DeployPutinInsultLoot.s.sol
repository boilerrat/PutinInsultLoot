// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "../src/PutinInsultLoot.sol";

contract DeployPutinInsultLoot is Script {
    function run() external {
        // Load private key from the environment variable
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the PutinInsultLoot contract
        PutinInsultLoot putinInsultLoot = new PutinInsultLoot();

        // Optionally, you can log the contract address after deployment
        console.log("PutinInsultLoot deployed at:", address(putinInsultLoot));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
