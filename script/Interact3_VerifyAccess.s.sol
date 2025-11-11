// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/AccessToken.sol";

/**
 * @title Interact3_VerifyAccess
 * @notice Verify that a reader has active access to a book
 */
contract Interact3_VerifyAccess is Script {
    // Deployed contract address
    address constant ACCESS_TOKEN = 0x07D9a8173353673412aDb9a44d661269Dce4B795;
    
    // Test reader address (same as granted)
    address constant READER = 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1;
    
    // Book ID
    string constant BOOK_ID = "book:the-great-gatsby";

    function run() external view {
        AccessToken accessToken = AccessToken(ACCESS_TOKEN);
        
        console.log("=== Verifying Access ===");
        console.log("Reader:", READER);
        console.log("Book:", BOOK_ID);
        
        bool hasAccess = accessToken.verifyAccess(READER, BOOK_ID);
        
        console.log("\nVerification Result:", hasAccess);
        
        if (hasAccess) {
            console.log("Reader has ACTIVE access to this book");
            
            // Get access details
            (uint256 grantedAt, uint256 expiresAt, bool isActive) = 
                accessToken.getAccessDetails(READER, BOOK_ID);
            
            console.log("\nAccess Details:");
            console.log("- Granted at:", grantedAt);
            console.log("- Expires at:", expiresAt);
            console.log("- Is Active:", isActive);
        } else {
            console.log("Reader does NOT have access to this book");
        }
    }
}
