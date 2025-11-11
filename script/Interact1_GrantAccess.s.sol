// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/AccessToken.sol";

/**
 * @title Interact1_GrantAccess
 * @notice Grant access to a reader for a book
 */
contract Interact1_GrantAccess is Script {
    // Deployed contract addresses
    address constant ACCESS_TOKEN = 0x07D9a8173353673412aDb9a44d661269Dce4B795;
    
    // Test reader address (can be any address)
    address constant READER = 0x742d35cC6634c0532925A3b844bc9E7595F0beB1;
    
    // Book ID
    string constant BOOK_ID = "book:the-great-gatsby";
    
    // Duration: 30 days in seconds
    uint256 constant DURATION = 30 days;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);

        AccessToken accessToken = AccessToken(ACCESS_TOKEN);
        
        console.log("=== Granting Access ===");
        console.log("Reader:", READER);
        console.log("Book:", BOOK_ID);
        console.log("Duration:", DURATION, "seconds (30 days)");
        
        accessToken.grantAccess(READER, BOOK_ID, DURATION);
        
        console.log("\nAccess granted successfully!");
        console.log("Reader can now access the book for 30 days");

        vm.stopBroadcast();
    }
}
