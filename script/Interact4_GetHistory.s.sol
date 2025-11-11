// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/ProofOfRead.sol";

/**
 * @title Interact4_GetHistory
 * @notice Get the reading history for a reader
 */
contract Interact4_GetHistory is Script {
    // Deployed contract address
    address constant PROOF_OF_READ = 0xC413ffFFa2acE6Ab1DCd94eB2D71307cCF859fA4;

    function run() external view {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployer = vm.addr(deployerPrivateKey);
        
        ProofOfRead proofOfRead = ProofOfRead(PROOF_OF_READ);
        
        console.log("=== Getting Reading History ===");
        console.log("Reader:", deployer);
        
        // Get reading history
        ProofOfRead.ReadRecord[] memory history = proofOfRead.getReadingHistory(deployer);
        
        console.log("\nTotal Books Read:", history.length);
        
        if (history.length > 0) {
            console.log("\nReading History:");
            for (uint256 i = 0; i < history.length; i++) {
                console.log("\n--- Book", i + 1, "---");
                console.log("Book ID:", history[i].bookId);
                console.log("Read at:", history[i].timestamp);
                console.log("Public:", history[i].isPublic);
            }
            
            // Get reader stats
            (uint256 totalReads, uint256 publicReads, uint256 privateReads) = 
                proofOfRead.getReaderStats(deployer);
            
            console.log("\nReader Statistics:");
            console.log("- Total Reads:", totalReads);
            console.log("- Public Reads:", publicReads);
            console.log("- Private Reads:", privateReads);
        } else {
            console.log("\nNo reading history found for this reader");
        }
    }
}
