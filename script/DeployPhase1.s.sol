// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/AccessToken.sol";
import "../src/ProofOfRead.sol";

/**
 * @title DeployPhase1
 * @notice Deployment script for Phase 1 contracts
 * @dev Run with: forge script script/DeployPhase1.s.sol:DeployPhase1 --rpc-url base-sepolia --broadcast --verify
 */
contract DeployPhase1 is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);

        // Deploy AccessToken
        AccessToken accessToken = new AccessToken();
        console.log("AccessToken deployed to:", address(accessToken));

        // Deploy ProofOfRead
        ProofOfRead proofOfRead = new ProofOfRead();
        console.log("ProofOfRead deployed to:", address(proofOfRead));

        vm.stopBroadcast();

        // Log deployment summary
        console.log("\n=== Deployment Summary ===");
        console.log("Network: Base Sepolia");
        console.log("AccessToken:", address(accessToken));
        console.log("ProofOfRead:", address(proofOfRead));
        console.log("Deployer:", vm.addr(deployerPrivateKey));
    }
}
