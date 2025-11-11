# The Literary Network

**A modular Web3 reading application on Base**

## Project Summary

Build and deploy a modular Web3 reading application on Base. The goal is to create an on-chain reader experience where users can access, read, review, lend, and earn attestations for books—all through standard, low-gas Base transactions.

Development will move phase by phase, defining each module in plain English first, then building and testing in Warp. Progress through Base's funding ladder: Weekly Rewards → Builder Grants → OP Retro Funding → Base Batches.

## Phase 1 - Deployed to Base Sepolia ✅

### Deployed Contracts

- **AccessToken**: [0x07D9a8173353673412aDb9a44d661269Dce4B795](https://sepolia.basescan.org/address/0x07D9a8173353673412aDb9a44d661269Dce4B795)
- **ProofOfRead**: [0xC413ffFFa2acE6Ab1DCd94eB2D71307cCF859fA4](https://sepolia.basescan.org/address/0xC413ffFFa2acE6Ab1DCd94eB2D71307cCF859fA4)

**Deployment Date**: November 11, 2025  
**Network**: Base Sepolia (Chain ID: 84532)  
**Block**: 33554897

### Documentation & Proof

- 📋 [Deployment Artifacts](deploy/phase1_deploy.json) - Contract addresses, transaction hashes, and deployment details
- ✅ [Verification Checklist](docs/phase1_verification.md) - Complete testing checklist with all scenarios
- 📊 [Test Report](docs/phase1_test_report.md) - Detailed test results and gas analysis
- 📖 [Access Token Docs](docs/access_token.md) - Contract interface and usage
- 📖 [Proof of Read Docs](docs/proof_of_read.md) - Reading history tracking
- 🚀 [Deployment Guide](DEPLOYMENT_GUIDE.md) - How to deploy contracts

### Deployment Transactions

1. **AccessToken Deployment**: [0xd17eb66672e0552f4e0ea685822cb74ae2305829cc895bcc24fabb0f297a9f0b](https://sepolia.basescan.org/tx/0xd17eb66672e0552f4e0ea685822cb74ae2305829cc895bcc24fabb0f297a9f0b)
2. **ProofOfRead Deployment**: [0xb2cda7c034b4943a3b72df51c1e2df4dc50aa00ce3815a41f11d52f70ffc6dbc](https://sepolia.basescan.org/tx/0xb2cda7c034b4943a3b72df51c1e2df4dc50aa00ce3815a41f11d52f70ffc6dbc)

**Gas Used**: 0.0015 ETH

---

## Project Structure

```
literary-network/
├── src/                    # Smart contracts
│   ├── AccessToken.sol     # Time-based access control
│   └── ProofOfRead.sol     # On-chain reading records
├── script/                 # Deployment scripts
│   └── DeployPhase1.s.sol  # Phase 1 deployment
├── docs/                   # Documentation
│   ├── phase-0/           # Core definitions
│   ├── phase-1/           # Core reader MVP
│   ├── access_token.md    # AccessToken docs
│   └── proof_of_read.md   # ProofOfRead docs
├── deploy/                 # Deployment artifacts
│   └── phase1_deploy.json # Phase 1 deployment data
├── screenshots/            # Proof screenshots
├── logs/                   # Deployment logs
└── sim/                    # Simulation scenarios
    └── phase1_scenarios.json
```

---

## Development Phases

### PHASE 0 — CORE DEFINITIONS ✅ Complete
- ✅ Product Glossary with 50+ terms
- ✅ Project structure
- ✅ Documentation templates

### PHASE 1 — CORE READER MVP ✅ Deployed
- ✅ AccessToken contract - Time-based access control
- ✅ ProofOfRead contract - Immutable reading records
- ✅ Deployed to Base Sepolia
- ⏳ On-chain interactions (pending)

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

---

## Tech Stack

- **Blockchain**: Base (Sepolia testnet → Mainnet)
- **Smart Contracts**: Solidity 0.8.19
- **Development**: Foundry
- **Storage**: IPFS / Arweave (future)
- **Attestations**: EAS (future)

---

## Quick Start

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Base Sepolia ETH (from [faucet](https://www.coinbase.com/faucets/base-ethereum-sepolia-faucet))

### Build

```bash
forge build
```

### Test

```bash
forge test
```

### Deploy

```bash
# Set up .env file with PRIVATE_KEY
cp .env.example .env

# Deploy to Base Sepolia
forge script script/DeployPhase1.s.sol:DeployPhase1 \
  --rpc-url base-sepolia \
  --broadcast \
  -vvvv
```

See [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for detailed instructions.

---

## Milestones & Funding

- **Weekly Rewards**: ✅ Eligible (Phase 1 deployed)
- **Builder Grant**: After Phase 3 mainnet deployment
- **OP Retro Funding**: After Phase 7 open-source release
- **Base Batches**: After public beta

---

## Status

**Current Phase**: PHASE 1 - Core Reader MVP (Deployed to Base Sepolia)  
**Last Updated**: 2025-11-11

**Next Steps**:
- Run 5+ on-chain interactions
- Update test report with results
- Prepare Weekly Rewards submission

---

## Links

- **Repository**: https://github.com/tarshablackhorn/literary-network
- **AccessToken Contract**: https://sepolia.basescan.org/address/0x07D9a8173353673412aDb9a44d661269Dce4B795
- **ProofOfRead Contract**: https://sepolia.basescan.org/address/0xC413ffFFa2acE6Ab1DCd94eB2D71307cCF859fA4
- **Documentation**: [docs/README.md](docs/README.md)

---

Built with ❤️ on Base
