# Access Token

## Overview

The Access Token contract manages reader access permissions to literary works within the Literary Network. It implements a time-based access control system that allows authors and publishers to grant temporary or permanent access to their content.

## Features

- **Grant Access**: Authors can grant readers access to specific works for a defined duration
- **Verify Access**: Check if a reader currently has valid access to a work
- **Revoke Access**: Remove access privileges before expiration
- **Expiration Management**: Automatic expiration of access tokens based on time

## Contract Interface

### Functions

#### `grantAccess(address reader, string bookId, uint256 duration)`
Grants a reader access to a specific book for a given duration.

**Parameters:**
- `reader`: Ethereum address of the reader
- `bookId`: Unique identifier for the literary work
- `duration`: Access duration in seconds

#### `verifyAccess(address reader, string bookId) returns (bool)`
Verifies if a reader has current valid access to a book.

**Parameters:**
- `reader`: Ethereum address of the reader
- `bookId`: Unique identifier for the literary work

**Returns:** Boolean indicating whether access is valid

#### `revokeAccess(address reader, string bookId)`
Revokes a reader's access to a book before expiration.

**Parameters:**
- `reader`: Ethereum address of the reader
- `bookId`: Unique identifier for the literary work

## Events

- `AccessGranted(address indexed reader, string indexed bookId, uint256 expiresAt)`
- `AccessRevoked(address indexed reader, string indexed bookId)`
- `AccessExpired(address indexed reader, string indexed bookId)`

## Usage Examples

See `sim/phase1_scenarios.json` for example scenarios and usage patterns.
