# Proof of Read

## Overview

The Proof of Read contract creates immutable records of reading activity within the Literary Network. It allows readers to prove they have engaged with a literary work, creating a verifiable reading history on the blockchain.

## Features

- **Record Reading Activity**: Create timestamped records of reading completion
- **Verify Reading History**: Query past reading records for any reader
- **Privacy Options**: Support for private or public reading records
- **Reading Statistics**: Track engagement metrics across the network

## Contract Interface

### Functions

#### `recordRead(address reader, string bookId, uint256 timestamp)`
Records that a reader has completed reading a work.

**Parameters:**
- `reader`: Ethereum address of the reader
- `bookId`: Unique identifier for the literary work
- `timestamp`: Unix timestamp of reading completion

#### `getReadingHistory(address reader) returns (ReadRecord[])`
Retrieves the complete reading history for a reader.

**Parameters:**
- `reader`: Ethereum address of the reader

**Returns:** Array of reading records

#### `verifyRead(address reader, string bookId) returns (bool)`
Checks if a reader has a recorded read for a specific book.

**Parameters:**
- `reader`: Ethereum address of the reader
- `bookId`: Unique identifier for the literary work

**Returns:** Boolean indicating whether a read record exists

#### `getBookReadCount(string bookId) returns (uint256)`
Gets the total number of reads for a specific book.

**Parameters:**
- `bookId`: Unique identifier for the literary work

**Returns:** Total read count

## Data Structures

### ReadRecord
```solidity
struct ReadRecord {
    address reader;
    string bookId;
    uint256 timestamp;
    bool isPublic;
}
```

## Events

- `ReadRecorded(address indexed reader, string indexed bookId, uint256 timestamp)`
- `ReadingHistoryUpdated(address indexed reader, uint256 totalReads)`

## Privacy Considerations

Readers can choose to make their reading records public or private. Private records are still stored on-chain but marked as private, allowing readers to selectively share their reading history.

## Usage Examples

See `sim/phase1_scenarios.json` for example scenarios and usage patterns.
