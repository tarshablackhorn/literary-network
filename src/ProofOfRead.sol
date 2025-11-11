// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ProofOfRead
 * @notice Creates immutable records of reading activity on-chain
 * @dev Part of Phase 1 - Core Reader MVP for Literary Network
 */
contract ProofOfRead {
    struct ReadRecord {
        address reader;
        string bookId;
        uint256 timestamp;
        bool isPublic;
    }

    // Array of all read records
    ReadRecord[] public allReadRecords;

    // Mapping: reader address => array of their read record indices
    mapping(address => uint256[]) public readerRecordIndices;

    // Mapping: reader address => book ID => has read boolean
    mapping(address => mapping(string => bool)) public hasRead;

    // Mapping: book ID => total read count
    mapping(string => uint256) public bookReadCounts;

    // Events
    event ReadRecorded(
        address indexed reader,
        string indexed bookId,
        uint256 timestamp,
        uint256 recordIndex
    );
    event ReadingHistoryUpdated(address indexed reader, uint256 totalReads);

    /**
     * @notice Record that a reader has completed reading a book
     * @param bookId Unique identifier for the book
     * @param isPublic Whether this read record should be public
     */
    function recordRead(string memory bookId, bool isPublic) external {
        require(bytes(bookId).length > 0, "Invalid book ID");
        require(!hasRead[msg.sender][bookId], "Already recorded read for this book");

        // Create read record
        ReadRecord memory newRecord = ReadRecord({
            reader: msg.sender,
            bookId: bookId,
            timestamp: block.timestamp,
            isPublic: isPublic
        });

        // Add to all records
        allReadRecords.push(newRecord);
        uint256 recordIndex = allReadRecords.length - 1;

        // Update reader's indices
        readerRecordIndices[msg.sender].push(recordIndex);

        // Mark as read
        hasRead[msg.sender][bookId] = true;

        // Increment book read count
        bookReadCounts[bookId]++;

        emit ReadRecorded(msg.sender, bookId, block.timestamp, recordIndex);
        emit ReadingHistoryUpdated(
            msg.sender,
            readerRecordIndices[msg.sender].length
        );
    }

    /**
     * @notice Get reading history for a specific reader
     * @param reader Address of the reader
     * @return records Array of read records
     */
    function getReadingHistory(address reader)
        external
        view
        returns (ReadRecord[] memory records)
    {
        uint256[] memory indices = readerRecordIndices[reader];
        records = new ReadRecord[](indices.length);

        for (uint256 i = 0; i < indices.length; i++) {
            records[i] = allReadRecords[indices[i]];
        }

        return records;
    }

    /**
     * @notice Verify if a reader has recorded a read for a specific book
     * @param reader Address of the reader
     * @param bookId Unique identifier for the book
     * @return bool True if read has been recorded
     */
    function verifyRead(address reader, string memory bookId)
        external
        view
        returns (bool)
    {
        return hasRead[reader][bookId];
    }

    /**
     * @notice Get the total number of reads for a book
     * @param bookId Unique identifier for the book
     * @return uint256 Total read count
     */
    function getBookReadCount(string memory bookId)
        external
        view
        returns (uint256)
    {
        return bookReadCounts[bookId];
    }

    /**
     * @notice Get the total number of read records in the system
     * @return uint256 Total number of reads
     */
    function getTotalReads() external view returns (uint256) {
        return allReadRecords.length;
    }

    /**
     * @notice Get a specific read record by index
     * @param index Index of the read record
     * @return record The read record at that index
     */
    function getReadRecord(uint256 index)
        external
        view
        returns (ReadRecord memory record)
    {
        require(index < allReadRecords.length, "Index out of bounds");
        return allReadRecords[index];
    }

    /**
     * @notice Get reading stats for a reader
     * @param reader Address of the reader
     * @return totalReads Total number of books read
     * @return publicReads Number of public reads
     * @return privateReads Number of private reads
     */
    function getReaderStats(address reader)
        external
        view
        returns (
            uint256 totalReads,
            uint256 publicReads,
            uint256 privateReads
        )
    {
        uint256[] memory indices = readerRecordIndices[reader];
        totalReads = indices.length;

        for (uint256 i = 0; i < indices.length; i++) {
            if (allReadRecords[indices[i]].isPublic) {
                publicReads++;
            } else {
                privateReads++;
            }
        }

        return (totalReads, publicReads, privateReads);
    }
}
