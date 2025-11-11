// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title AccessToken
 * @notice Manages time-based access control for literary works
 * @dev Part of Phase 1 - Core Reader MVP for Literary Network
 */
contract AccessToken {
    struct Access {
        uint256 grantedAt;
        uint256 expiresAt;
        bool isActive;
    }

    // Mapping: reader address => book ID => Access details
    mapping(address => mapping(string => Access)) public accessRecords;
    
    // Contract owner (author/publisher)
    address public owner;

    // Events
    event AccessGranted(address indexed reader, string indexed bookId, uint256 expiresAt);
    event AccessRevoked(address indexed reader, string indexed bookId);
    event AccessExpired(address indexed reader, string indexed bookId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Grant access to a reader for a specific book
     * @param reader Address of the reader
     * @param bookId Unique identifier for the book
     * @param duration Access duration in seconds
     */
    function grantAccess(
        address reader,
        string memory bookId,
        uint256 duration
    ) external onlyOwner {
        require(reader != address(0), "Invalid reader address");
        require(bytes(bookId).length > 0, "Invalid book ID");
        require(duration > 0, "Duration must be greater than 0");

        uint256 expiresAt = block.timestamp + duration;

        accessRecords[reader][bookId] = Access({
            grantedAt: block.timestamp,
            expiresAt: expiresAt,
            isActive: true
        });

        emit AccessGranted(reader, bookId, expiresAt);
    }

    /**
     * @notice Verify if a reader has active access to a book
     * @param reader Address of the reader
     * @param bookId Unique identifier for the book
     * @return bool True if access is valid and not expired
     */
    function verifyAccess(address reader, string memory bookId)
        external
        view
        returns (bool)
    {
        Access memory access = accessRecords[reader][bookId];
        
        if (!access.isActive) {
            return false;
        }

        if (block.timestamp > access.expiresAt) {
            return false;
        }

        return true;
    }

    /**
     * @notice Revoke access before expiration
     * @param reader Address of the reader
     * @param bookId Unique identifier for the book
     */
    function revokeAccess(address reader, string memory bookId)
        external
        onlyOwner
    {
        require(accessRecords[reader][bookId].isActive, "Access not active");

        accessRecords[reader][bookId].isActive = false;

        emit AccessRevoked(reader, bookId);
    }

    /**
     * @notice Get access details for a reader and book
     * @param reader Address of the reader
     * @param bookId Unique identifier for the book
     * @return grantedAt Timestamp when access was granted
     * @return expiresAt Timestamp when access expires
     * @return isActive Whether access is currently active
     */
    function getAccessDetails(address reader, string memory bookId)
        external
        view
        returns (
            uint256 grantedAt,
            uint256 expiresAt,
            bool isActive
        )
    {
        Access memory access = accessRecords[reader][bookId];
        return (access.grantedAt, access.expiresAt, access.isActive);
    }

    /**
     * @notice Transfer ownership of the contract
     * @param newOwner Address of the new owner
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid new owner");
        owner = newOwner;
    }
}
