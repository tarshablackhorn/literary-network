# The Literary Network - Documentation

This directory contains phase-by-phase documentation for The Literary Network project.

## Documentation Structure

Each phase has its own directory with detailed specifications, module definitions, and progress tracking.

---

## Phase Documentation

### [PHASE 0 — CORE DEFINITIONS](./phase-0/PHASE-0.md) ✅ In Progress
Define all core terms, ID patterns, entity relationships, and role boundaries.

**Key Deliverables:**
- Product Glossary
- ID Pattern Specifications
- Entity Relationship Map
- Roles and Privacy Table

**Status**: Task 0.1 Complete (Glossary), Task 0.2 In Progress

---

### [PHASE 1 — CORE READER MVP](./phase-1/)
Build the foundational reading experience: access tokens and proof of read.

**Key Deliverables:**
- Reader Access Token Contract
- Proof of Read Contract
- End-to-end test flow
- Base Sepolia deployment

**Status**: Not Started (Awaiting Phase 0 completion)

---

### [PHASE 2 — CHAPTERS AND BUNDLES](./phase-2/)
Add support for book chapters and bundled collections.

**Key Deliverables:**
- Chapter Map Contract
- Bundle Access Contract
- Resolution logic (Bundle → Book → Chapter)

**Status**: Not Started

---

### [PHASE 3 — REVIEWS AND RATINGS](./phase-3/)
Enable readers to review books and calculate reputation scores.

**Key Deliverables:**
- Review Ledger Contract
- Reputation Snapshot Logic
- Mainnet deployment package

**Status**: Not Started

---

### [PHASE 4 — LENDING SYSTEM](./phase-4/)
Implement book lending with time-limited access.

**Key Deliverables:**
- Lending Rules Contract
- Loan Request/Approval Flow
- Active Loan Check Logic

**Status**: Not Started

---

### [PHASE 5 — BADGES AND ATTESTATIONS](./phase-5/)
Reward readers with badges and export portable attestations.

**Key Deliverables:**
- Achievement Badge Contract
- Attestation Export Logic
- EAS Integration

**Status**: Not Started

---

### [PHASE 6 — METRICS AND TRANSPARENCY](./phase-6/)
Track platform usage and display public metrics.

**Key Deliverables:**
- Metrics Counter Contract
- Public Dashboard Interface
- Weekly metrics updates

**Status**: Not Started

---

### [PHASE 7 — OPEN-SOURCE SLICE](./phase-7/)
Extract reusable lending + review module for open-source release.

**Key Deliverables:**
- Standalone Lend + Review Module
- Open-source documentation
- OP Retro Funding application

**Status**: Not Started

---

### [PHASE 8 — SAFETY AND ABUSE CONTROLS](./phase-8/)
Add moderation and rate limiting for safe public beta.

**Key Deliverables:**
- Moderation Queue Contract
- Rate Limit Logic
- Public beta release

**Status**: Not Started

---

## Templates

- **[PHASE_TEMPLATE.md](./PHASE_TEMPLATE.md)**: Standard template for documenting each phase

---

## Quick Links

- [Product Glossary](./phase-0/literary-network-glossary.md) - All term definitions
- [Main README](../README.md) - Project overview
- [Contracts](../contracts/) - Smart contract code
- [Tests](../tests/) - Test files

---

## Funding Milestones

Track progress toward Base funding opportunities:

- **Weekly Rewards**: After Phase 1 completion ✅ Eligible after MVP deployed
- **Builder Grant**: After Phase 3 mainnet deployment
- **OP Retro Funding**: After Phase 7 open-source release
- **Base Batches**: After Phase 8 public beta

---

**Last Updated**: 2025-11-11
