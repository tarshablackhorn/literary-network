// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/ProofOfRead.sol";

/**
 * @title Interact2_RecordRead
 * @notice Record that a reader has completed reading a book
 */
contract Interact2_RecordRead is Script {
    // Deployed contract address
    address constant PROOF_OF_READ = 0xC413ffFFa2acE6Ab1DCd94eB2D71307cCF859fA4;
    
    // Book ID (same as granted access)
    string constant BOOK_ID = "book:the-great-gatsby";
    
    // Make this read public
    bool constant IS_PUBLIC = true;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);

        ProofOfRead proofOfRead = ProofOfRead(PROOF_OF_READ);
        
        console.log("=== Recording Proof of Read ===");
        console.log("Book:", BOOK_ID);
        console.log("Public:", IS_PUBLIC);
        
        proofOfRead.recordRead(BOOK_ID, IS_PUBLIC);
        
        console.log("\nProof of read recorded successfully!");
        console.log("This reading activity is now permanently on-chain");

        vm.stopBroadcast();
    }
}
