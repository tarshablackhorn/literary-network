# Contract and Data ID Patterns

**Version:** 1.0  
**Phase:** PHASE 0 - Core Definitions  
**Last Updated:** 2025-11-11

---

## Overview

This document defines consistent ID patterns and data structures for all entities in The Literary Network. Standardized IDs ensure uniqueness, prevent collisions, and enable efficient lookups across contracts.

---

## ID Format Standards

### General Principles
1. **Uniqueness**: Every entity must have a globally unique identifier
2. **Immutability**: IDs should not change once assigned
3. **Deterministic**: Where possible, IDs should be derivable from entity properties
4. **Gas Efficient**: Use appropriate data types (uint256 vs bytes32 vs address)
5. **Collision Resistant**: Use hashing for composite IDs

### Data Types
- **uint256**: Sequential counters, simple numeric IDs
- **bytes32**: Hash-based IDs, composite keys
- **address**: Wallet addresses (Readers, Authors)

---

## Entity ID Patterns

### 1. Book ID

**Type:** `bytes32`  
**Generation Method:** Hash of (author address + title + publication timestamp)  
**Purpose:** Unique identifier for each book

**Structure:**
```solidity
bookId = keccak256(abi.encodePacked(authorAddress, bookTitle, publicationTimestamp))
```

**Example:**
```solidity
// Author: 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1
// Title: "The Blockchain Manifesto"
// Timestamp: 1699876543
bookId = keccak256(abi.encodePacked(
    0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1,
    "The Blockchain Manifesto",
    1699876543
))
// Result: 0x8f3e...a7c2 (bytes32)
```

**Collision Prevention:** The combination of author address, exact title, and precise timestamp ensures uniqueness. Authors cannot publish two books with identical titles at the same timestamp.

---

### 2. Chapter ID

**Type:** `bytes32`  
**Generation Method:** Hash of (Book ID + chapter sequence number)  
**Purpose:** Unique identifier for each chapter within a book

**Structure:**
```solidity
chapterId = keccak256(abi.encodePacked(bookId, chapterSequence))
```

**Example:**
```solidity
// Book ID: 0x8f3e...a7c2
// Chapter Sequence: 1 (first chapter)
chapterId = keccak256(abi.encodePacked(
    0x8f3e...a7c2,
    uint256(1)
))
// Result: 0x4a2b...f8d1 (bytes32)
```

**Collision Prevention:** Unique bookId + sequence ensures no two chapters have the same ID.

---

### 3. Bundle ID

**Type:** `bytes32`  
**Generation Method:** Hash of (creator address + bundle name + creation timestamp)  
**Purpose:** Unique identifier for book bundles

**Structure:**
```solidity
bundleId = keccak256(abi.encodePacked(creatorAddress, bundleName, creationTimestamp))
```

**Example:**
```solidity
// Creator: 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1
// Name: "Sci-Fi Classics"
// Timestamp: 1699876600
bundleId = keccak256(abi.encodePacked(
    0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1,
    "Sci-Fi Classics",
    1699876600
))
// Result: 0x9d4c...b2e3 (bytes32)
```

**Collision Prevention:** Same as Book ID pattern - creator + name + timestamp.

---

### 4. Reader ID

**Type:** `address`  
**Generation Method:** Wallet address  
**Purpose:** Identifies a reader on the network

**Structure:**
```solidity
readerId = msg.sender // or any valid Ethereum address
```

**Example:**
```solidity
readerId = 0x1234567890abcdef1234567890abcdef12345678
```

**Collision Prevention:** Ethereum addresses are cryptographically unique.

---

### 5. Author ID

**Type:** `address`  
**Generation Method:** Wallet address  
**Purpose:** Identifies book authors

**Structure:**
```solidity
authorId = authorWalletAddress
```

**Example:**
```solidity
authorId = 0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb1
```

**Note:** Same as Reader ID - addresses can have multiple roles.

---

### 6. Access Token ID

**Type:** `bytes32`  
**Generation Method:** Hash of (reader address + book ID)  
**Purpose:** Unique identifier for reader access grants

**Structure:**
```solidity
accessTokenId = keccak256(abi.encodePacked(readerAddress, bookId))
```

**Example:**
```solidity
// Reader: 0x1234567890abcdef1234567890abcdef12345678
// Book: 0x8f3e...a7c2
accessTokenId = keccak256(abi.encodePacked(
    0x1234567890abcdef1234567890abcdef12345678,
    0x8f3e...a7c2
))
// Result: 0x7b3f...c4d5 (bytes32)
```

**Collision Prevention:** One reader can only have one access token per book.

---

### 7. Proof of Read ID

**Type:** `bytes32`  
**Generation Method:** Hash of (reader address + book/chapter ID + completion timestamp)  
**Purpose:** Unique identifier for read completion events

**Structure:**
```solidity
proofId = keccak256(abi.encodePacked(readerAddress, contentId, completionTimestamp))
```

**Example:**
```solidity
// Reader: 0x1234567890abcdef1234567890abcdef12345678
// Book: 0x8f3e...a7c2
// Timestamp: 1699880000
proofId = keccak256(abi.encodePacked(
    0x1234567890abcdef1234567890abcdef12345678,
    0x8f3e...a7c2,
    1699880000
))
// Result: 0x2c5e...d7a1 (bytes32)
```

**Collision Prevention:** Timestamp ensures multiple read events are distinguishable.

---

### 8. Review ID

**Type:** `bytes32`  
**Generation Method:** Hash of (reviewer address + book ID + submission timestamp)  
**Purpose:** Unique identifier for book reviews

**Structure:**
```solidity
reviewId = keccak256(abi.encodePacked(reviewerAddress, bookId, submissionTimestamp))
```

**Example:**
```solidity
// Reviewer: 0x1234567890abcdef1234567890abcdef12345678
// Book: 0x8f3e...a7c2
// Timestamp: 1699881234
reviewId = keccak256(abi.encodePacked(
    0x1234567890abcdef1234567890abcdef12345678,
    0x8f3e...a7c2,
    1699881234
))
// Result: 0x6d8a...e9f2 (bytes32)
```

**Collision Prevention:** Timestamp allows multiple reviews from same reader (if system allows updates).

**Note:** If one review per reader per book is enforced, timestamp may be omitted:
```solidity
reviewId = keccak256(abi.encodePacked(reviewerAddress, bookId))
```

---

### 9. Loan Request ID

**Type:** `bytes32`  
**Generation Method:** Hash of (borrower address + book ID + request timestamp)  
**Purpose:** Unique identifier for lending requests

**Structure:**
```solidity
loanRequestId = keccak256(abi.encodePacked(borrowerAddress, bookId, requestTimestamp))
```

**Example:**
```solidity
// Borrower: 0x1234567890abcdef1234567890abcdef12345678
// Book: 0x8f3e...a7c2
// Timestamp: 1699882000
loanRequestId = keccak256(abi.encodePacked(
    0x1234567890abcdef1234567890abcdef12345678,
    0x8f3e...a7c2,
    1699882000
))
// Result: 0x3f7b...a8c3 (bytes32)
```

**Collision Prevention:** Timestamp enables multiple loan requests from same borrower for same book.

---

### 10. Active Loan ID

**Type:** `bytes32`  
**Generation Method:** Hash of (borrower address + book ID + loan start timestamp)  
**Purpose:** Unique identifier for active loans

**Structure:**
```solidity
activeLoanId = keccak256(abi.encodePacked(borrowerAddress, bookId, loanStartTimestamp))
```

**Example:**
```solidity
// Borrower: 0x1234567890abcdef1234567890abcdef12345678
// Book: 0x8f3e...a7c2
// Start Time: 1699882500
activeLoanId = keccak256(abi.encodePacked(
    0x1234567890abcdef1234567890abcdef12345678,
    0x8f3e...a7c2,
    1699882500
))
// Result: 0x5e9d...f4a7 (bytes32)
```

**Collision Prevention:** Start timestamp differentiates sequential loans of the same book.

---

### 11. Achievement Badge ID

**Type:** `uint256`  
**Generation Method:** Sequential counter  
**Purpose:** Unique badge type identifier

**Structure:**
```solidity
uint256 public nextBadgeId = 1;

function createBadgeType() internal returns (uint256) {
    uint256 badgeId = nextBadgeId;
    nextBadgeId++;
    return badgeId;
}
```

**Example:**
```solidity
badgeId = 1 // "First Book Read"
badgeId = 2 // "10 Books Read"
badgeId = 3 // "First Review Written"
```

**Individual Badge Instance:**
```solidity
badgeInstanceId = keccak256(abi.encodePacked(readerAddress, badgeId, awardTimestamp))
```

**Collision Prevention:** Sequential counter ensures unique badge types. Instances use composite hash.

---

### 12. Attestation ID

**Type:** `bytes32`  
**Generation Method:** Hash of (reader address + proof of read ID + export timestamp)  
**Purpose:** Unique identifier for exported attestations

**Structure:**
```solidity
attestationId = keccak256(abi.encodePacked(readerAddress, proofId, exportTimestamp))
```

**Example:**
```solidity
// Reader: 0x1234567890abcdef1234567890abcdef12345678
// Proof: 0x2c5e...d7a1
// Export Time: 1699885000
attestationId = keccak256(abi.encodePacked(
    0x1234567890abcdef1234567890abcdef12345678,
    0x2c5e...d7a1,
    1699885000
))
// Result: 0x8c4f...b6e9 (bytes32)
```

**Collision Prevention:** Export timestamp allows re-exporting the same proof multiple times.

---

## Data Structures

### Book Struct

```solidity
struct Book {
    bytes32 bookId;
    address author;
    string title;
    string contentURI; // IPFS or Arweave link
    uint256 publicationTimestamp;
    uint256 price; // in wei, 0 for free books
    bool isActive;
}
```

---

### Chapter Struct

```solidity
struct Chapter {
    bytes32 chapterId;
    bytes32 bookId;
    uint256 sequence;
    string title;
    string contentURI;
}
```

---

### Bundle Struct

```solidity
struct Bundle {
    bytes32 bundleId;
    address creator;
    string name;
    bytes32[] bookIds;
    uint256 creationTimestamp;
    uint256 price;
    bool isActive;
}
```

---

### AccessToken Struct

```solidity
struct AccessToken {
    bytes32 tokenId;
    address reader;
    bytes32 bookId;
    uint256 grantedAt;
    uint256 expiresAt; // 0 for permanent access
    bool isActive;
}
```

---

### ProofOfRead Struct

```solidity
struct ProofOfRead {
    bytes32 proofId;
    address reader;
    bytes32 contentId; // bookId or chapterId
    uint256 completionTimestamp;
    bool isVerified;
}
```

---

### Review Struct

```solidity
struct Review {
    bytes32 reviewId;
    address reviewer;
    bytes32 bookId;
    uint8 rating; // 1-5 stars
    string comment;
    uint256 submissionTimestamp;
    bool isVisible; // false if flagged/hidden
}
```

---

### LoanRequest Struct

```solidity
struct LoanRequest {
    bytes32 requestId;
    address borrower;
    bytes32 bookId;
    uint256 requestedDuration; // in seconds
    uint256 requestTimestamp;
    bool isApproved;
    bool isPending;
}
```

---

### ActiveLoan Struct

```solidity
struct ActiveLoan {
    bytes32 loanId;
    address borrower;
    bytes32 bookId;
    uint256 startTimestamp;
    uint256 endTimestamp;
    bool isActive;
}
```

---

### AchievementBadge Struct

```solidity
struct AchievementBadge {
    uint256 badgeId;
    string name;
    string description;
    string criteria; // e.g., "Read 10 books"
}

struct BadgeInstance {
    bytes32 instanceId;
    address recipient;
    uint256 badgeId;
    uint256 awardedAt;
}
```

---

### Attestation Struct

```solidity
struct Attestation {
    bytes32 attestationId;
    address issuer; // The Literary Network contract
    address recipient; // Reader
    bytes32 proofId;
    uint256 exportTimestamp;
    bytes signature; // EAS-compatible signature
}
```

---

## Collision Prevention Summary

| Entity | ID Type | Uniqueness Guaranteed By |
|--------|---------|--------------------------|
| Book | bytes32 | author + title + timestamp |
| Chapter | bytes32 | bookId + sequence |
| Bundle | bytes32 | creator + name + timestamp |
| Reader | address | Ethereum address uniqueness |
| Author | address | Ethereum address uniqueness |
| Access Token | bytes32 | reader + bookId |
| Proof of Read | bytes32 | reader + contentId + timestamp |
| Review | bytes32 | reviewer + bookId + timestamp |
| Loan Request | bytes32 | borrower + bookId + timestamp |
| Active Loan | bytes32 | borrower + bookId + startTime |
| Badge Type | uint256 | Sequential counter |
| Badge Instance | bytes32 | reader + badgeId + timestamp |
| Attestation | bytes32 | reader + proofId + exportTime |

---

## Usage Examples

### Creating a Book
```solidity
bytes32 bookId = keccak256(abi.encodePacked(
    msg.sender,
    _title,
    block.timestamp
));

Book memory newBook = Book({
    bookId: bookId,
    author: msg.sender,
    title: _title,
    contentURI: _contentURI,
    publicationTimestamp: block.timestamp,
    price: _price,
    isActive: true
});

books[bookId] = newBook;
```

### Granting Access
```solidity
bytes32 tokenId = keccak256(abi.encodePacked(_reader, _bookId));

AccessToken memory token = AccessToken({
    tokenId: tokenId,
    reader: _reader,
    bookId: _bookId,
    grantedAt: block.timestamp,
    expiresAt: 0, // permanent
    isActive: true
});

accessTokens[tokenId] = token;
```

### Recording Proof of Read
```solidity
bytes32 proofId = keccak256(abi.encodePacked(
    msg.sender,
    _bookId,
    block.timestamp
));

ProofOfRead memory proof = ProofOfRead({
    proofId: proofId,
    reader: msg.sender,
    contentId: _bookId,
    completionTimestamp: block.timestamp,
    isVerified: true
});

proofs[proofId] = proof;
```

---

## Next Steps

With ID patterns defined, we can now:
1. Map entity relationships (Task 0.3)
2. Design smart contract interfaces
3. Implement storage patterns in Phase 1

---

**Status:** Complete ✅  
**Next Document:** [Entity Relationships](./entity-relationships.md)
