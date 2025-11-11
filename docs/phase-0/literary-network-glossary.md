# The Literary Network - Product Glossary

**Version:** 1.0  
**Phase:** PHASE 0 - Core Definitions  
**Last Updated:** 2025-11-11

---

## Core Entities

### Book
A complete literary work stored on-chain or referenced on-chain. Each book has:
- Unique Book ID
- Metadata (title, author, publication date)
- Access control rules
- Chapter references (if applicable)
- Content location (IPFS hash, Arweave link, or on-chain storage reference)

### Chapter
A subdivision of a Book. Each chapter has:
- Unique Chapter ID
- Parent Book ID
- Sequence number (ordering within the book)
- Content location
- Individual access may be granted per chapter or inherited from book-level access

### Bundle
A curated collection of multiple Books grouped together. Bundles enable:
- Group pricing or access control
- Thematic collections (e.g., "Sci-Fi Classics", "Philosophy 101")
- Unique Bundle ID
- List of Book IDs included
- Bundle-level access rules

---

## User Roles

### Reader
A wallet address that has permission to read one or more Books.
- Can purchase or be granted access to books
- Can generate Proof of Read events
- Can write Reviews
- Can request to Borrow books via lending system
- Earns Badges and Attestations through reading activity

### Author
The creator or rights-holder of a Book.
- Can publish books to the network
- Sets access rules and pricing
- Can approve or deny Loan Requests
- Receives metrics about their books

### Admin
A privileged role with moderation and system control capabilities.
- Can flag or remove abusive Reviews
- Can adjust Rate Limits
- Can update system parameters
- Does NOT have direct control over user funds or private content

### Guest
An unauthenticated or wallet-less visitor.
- Can view public book metadata
- Can see aggregated Ratings and Reviews
- Cannot read full content or perform on-chain actions
- Must become a Reader to access content

---

## Access Control

### Reader Access Token
An on-chain record proving a Reader has permission to access a specific Book or Bundle.
- Granted upon purchase, gifting, or lending approval
- Verified before content delivery
- May have expiration (for loans) or be permanent (for purchases)

### Access Grant
The transaction or process by which a Reader receives an Access Token.
- Can be triggered by payment, admin action, or lending approval
- Recorded on-chain for transparency

### Access Verification
The check performed when a Reader attempts to open a Book or Chapter.
- Queries the blockchain for a valid Reader Access Token
- Returns true/false based on token existence and validity

---

## Reading and Engagement

### Proof of Read
An on-chain event recorded when a Reader completes reading a Book or Chapter.
- Contains: Reader address, Book/Chapter ID, timestamp
- Used to calculate reading metrics
- Required to unlock certain Badges
- Contributes to Reader's on-chain reading history

### Read Event
The individual transaction or log entry that creates a Proof of Read.
- Emitted by the smart contract
- Immutable once recorded

---

## Reviews and Reputation

### Review
A Reader-submitted evaluation of a Book, consisting of:
- Rating (e.g., 1-5 stars)
- Optional text comment
- Reviewer's wallet address
- Timestamp
- Stored on-chain or via verifiable off-chain storage

### Review Ledger
The complete, ordered history of all Reviews for a given Book.
- Immutable log of reviews
- Used to calculate Reputation Snapshot

### Reputation Snapshot
An aggregated view of a Book's reviews, showing:
- Average rating
- Total number of reviews
- Distribution of ratings (how many 1-star, 2-star, etc.)
- Can be updated periodically or on-demand

### Rating
The numerical score component of a Review (e.g., 1-5 scale).

---

## Lending System

### Lending Rules
Policies defined by an Author or system admin that govern how lending works for a Book.
- Examples: max loan duration, max concurrent loans, lending fee
- Enforced by smart contract logic

### Loan Request
A Reader-initiated transaction asking to borrow a Book.
- Contains: Requester address, Book ID, requested duration
- Awaits approval or auto-approval based on Lending Rules

### Active Loan
A currently in-progress loan where a Reader has temporary access to a Book.
- Has start and end timestamps
- Reader Access Token is time-limited
- After expiration, access is revoked

### Active Loan Check
The validation step that prevents a Reader from having multiple simultaneous loans of the same Book.

### Loan Approval
The transaction or event that converts a Loan Request into an Active Loan.
- May be automatic (if rules allow) or require Author consent

### Loan Expiration
The moment when an Active Loan ends and the Reader's temporary access is revoked.

---

## Badges and Attestations

### Achievement Badge
An on-chain token or record awarded to a Reader for reaching specific milestones.
- Examples: "Read 10 Books", "First Review", "Completed a Bundle"
- Non-transferable (soulbound)
- Visible on Reader's profile

### Attestation
A portable, verifiable proof-of-read credential that can be exported and used outside The Literary Network.
- Contains: Reader address, Book ID, timestamp, signature
- Follows standard attestation formats (e.g., EAS - Ethereum Attestation Service)
- Useful for cross-platform reputation or academic credit

### Attestation Export
The process or transaction that creates an Attestation from a Proof of Read.
- Reader-initiated
- May incur a small gas fee

---

## Metrics and Transparency

### Metrics Counter
An on-chain or aggregated tally of key platform events:
- Total books read
- Total reviews submitted
- Total loans completed
- Total badges earned
- Updated periodically or per transaction

### Public Dashboard
A publicly viewable interface displaying aggregated Metrics Counter data.
- No private user data exposed
- Shows platform health and activity trends
- Refreshed weekly or on-demand

---

## Safety and Moderation

### Moderation Queue
A list of flagged Reviews or content awaiting Admin review.
- Populated by automated filters or user reports
- Admins can approve, hide, or remove items

### Rate Limit
A restriction on how frequently a Reader can perform certain actions.
- Examples: max 5 reviews per day, max 3 loan requests per hour
- Prevents spam and abuse
- Enforced at smart contract or application layer

### Spam
Unwanted, repetitive, or low-quality content (usually Reviews).

### Abuse
Malicious activity such as fake reviews, harassment, or attempts to exploit the system.

---

## Technical Terms

### Contract
A smart contract deployed on Base (Sepolia testnet or mainnet) that implements specific logic.
- Examples: ReaderAccessContract, ProofOfReadContract, LendingContract

### Data ID
A unique identifier for any entity in the system.
- Format may vary: uint256, bytes32, or custom struct
- Examples: Book ID, Chapter ID, Bundle ID, Reader ID (wallet address)

### Gas
The transaction fee required to execute smart contract functions on Base.
- Paid in ETH (Base uses ETH for gas)
- The Literary Network is NOT gasless; users pay for their transactions

### Base
The Layer 2 Ethereum network where The Literary Network is deployed.
- Base Sepolia: testnet for development and testing
- Base Mainnet: production deployment

### IPFS / Arweave
Decentralized storage solutions for hosting book content.
- IPFS: InterPlanetary File System (content-addressed storage)
- Arweave: Permanent, pay-once storage

---

## Development and Funding

### Phase
A defined stage of development for The Literary Network.
- Phases 0-8 cover definitions, MVP, features, and safety
- Each phase has specific deliverables and success criteria

### Base Funding Ladder
The progression of grant opportunities from Base:
1. **Weekly Rewards** - Early builders
2. **Builder Grants** - Deployed projects
3. **OP Retro Funding** - Open-source contributions
4. **Base Batches** - Founder accelerator program

### Milestone
A specific achievement that unlocks eligibility for funding or marks project progress.
- Examples: "Phase 1 Complete", "Mainnet Deployment", "Public Beta Launch"

### Open-Source Slice
A reusable, standalone module extracted from The Literary Network and published as open-source.
- Example: Lend + Review core as a library
- Designed for OP Retro Funding eligibility

---

## Status and States

### Active
A record or token that is currently valid and in use.
- Examples: Active Loan, Active Reader Access Token

### Expired
A time-limited record that has passed its expiration timestamp and is no longer valid.

### Pending
A request or action awaiting approval or processing.
- Example: Pending Loan Request

### Completed
A finalized action or milestone.
- Example: Completed Loan, Completed Read

### Flagged
Content marked for review by moderation systems.

---

## Summary

This glossary defines all core terms used throughout The Literary Network project. Every future phase, smart contract, and feature description should reference terms from this glossary to ensure clarity and consistency.

**Next Steps (PHASE 0):**
- Define Contract and Data ID patterns
- Map relationships between Books, Bundles, and Readers
- Create Privacy and Roles table
- Verify no undefined terms remain
