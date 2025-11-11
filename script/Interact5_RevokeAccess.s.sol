// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/AccessToken.sol";

/**
 * @title Interact5_RevokeAccess
 * @notice Revoke a reader's access to a book before expiration
 */
contract Interact5_RevokeAccess is Script {
    // Deployed contract address
    address constant ACCESS_TOKEN = 0x07D9a8173353673412aDb9a44d661269Dce4B795;
    
    // Test reader address (same as granted)
    address constant READER = 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1;
    
    // Book ID
    string constant BOOK_ID = "book:the-great-gatsby";

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        vm.startBroadcast(deployerPrivateKey);

        AccessToken accessToken = AccessToken(ACCESS_TOKEN);
        
        console.log("=== Revoking Access ===");
        console.log("Reader:", READER);
        console.log("Book:", BOOK_ID);
        
        // Check access before revocation
        bool hadAccess = accessToken.verifyAccess(READER, BOOK_ID);
        console.log("Had access before revocation:", hadAccess);
        
        // Revoke access
        accessToken.revokeAccess(READER, BOOK_ID);
        
        console.log("\nAccess revoked successfully!");
        
        // Verify access is now revoked
        bool hasAccessNow = accessToken.verifyAccess(READER, BOOK_ID);
        console.log("Has access after revocation:", hasAccessNow);
        
        if (!hasAccessNow) {
            console.log("\nReader can no longer access this book");
        }

        vm.stopBroadcast();
    }
}
