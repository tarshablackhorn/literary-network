# The Literary Network

**A modular Web3 reading application on Base**

## Project Summary

Build and deploy a modular Web3 reading application on Base. The goal is to create an on-chain reader experience where users can access, read, review, lend, and earn attestations for books—all through standard, low-gas Base transactions.

Development will move phase by phase, defining each module in plain English first, then building and testing in Warp. Progress through Base's funding ladder: Weekly Rewards → Builder Grants → OP Retro Funding → Base Batches.

## Directory Structure

```
literary-network/
├── contracts/          # Smart contracts
│   ├── core/          # Core reader access and proof of read
│   ├── lending/       # Lending system contracts
│   ├── reviews/       # Review and reputation contracts
│   ├── badges/        # Achievement badges and attestations
│   └── metrics/       # Metrics and dashboard contracts
├── docs/              # Documentation for each phase
│   ├── phase-0/       # Core definitions
│   ├── phase-1/       # Core reader MVP
│   ├── phase-2/       # Chapters and bundles
│   ├── phase-3/       # Reviews and ratings
│   ├── phase-4/       # Lending system
│   ├── phase-5/       # Badges and attestations
│   ├── phase-6/       # Metrics and transparency
│   ├── phase-7/       # Open-source slice
│   └── phase-8/       # Safety and abuse controls
├── tests/             # Test files
├── scripts/           # Deployment and utility scripts
├── frontend/          # Web interface
└── README.md          # This file
```

## Development Phases

### PHASE 0 — CORE DEFINITIONS ✅ In Progress
1. ✅ Write Product Glossary
2. ✅ Set up project structure
3. Define Contract and Data ID patterns
4. Map relationships between books, bundles, and readers
5. Create Privacy and Roles table
6. Verify no undefined terms appear in later phases

### PHASE 1 — CORE READER MVP
- Reader Access Token logic
- Proof of Read logic
- End-to-end testing
- Deploy to Base Sepolia testnet

### PHASE 2 — CHAPTERS AND BUNDLES
- Chapter mapping
- Bundle access system

### PHASE 3 — REVIEWS AND RATINGS
- Review ledger
- Reputation snapshot
- Mainnet deployment preparation

### PHASE 4 — LENDING SYSTEM
- Lending rules and policies
- Loan request and approval flow
- Active loan management

### PHASE 5 — BADGES AND ATTESTATIONS
- Achievement badge system
- Attestation export for portable credentials

### PHASE 6 — METRICS AND TRANSPARENCY
- Metrics counter
- Public dashboard

### PHASE 7 — OPEN-SOURCE SLICE
- Extract reusable lending + review module
- Prepare for OP Retro Funding

### PHASE 8 — SAFETY AND ABUSE CONTROLS
- Moderation queue
- Rate limiting
- Public beta release

## Milestones & Funding

- **Weekly Rewards**: After Phase 1 completion
- **Builder Grant**: After Phase 3 mainnet deployment
- **OP Retro Funding**: After Phase 7 open-source release
- **Base Batches**: After public beta

## Tech Stack

- **Blockchain**: Base (Sepolia testnet → Mainnet)
- **Smart Contracts**: Solidity
- **Storage**: IPFS / Arweave
- **Attestations**: EAS (Ethereum Attestation Service)

## Getting Started

Documentation for each phase is located in the `docs/` directory. Start with [Phase 0 Glossary](docs/phase-0/literary-network-glossary.md) to understand all core terms.

## Status

**Current Phase**: PHASE 0 - Core Definitions  
**Last Updated**: 2025-11-11
