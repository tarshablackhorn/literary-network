# PHASE 0 — CORE DEFINITIONS

**Status**: In Progress  
**Start Date**: 2025-11-11  
**Completion Date**: [TBD]  
**Phase Goals**: Define all core terms, establish ID patterns, map entity relationships, and create clear role/privacy boundaries before writing any code.

---

## Overview

Phase 0 is the foundation of The Literary Network. Before building any smart contracts or features, we must:
1. Define every term that will be used throughout the project (Product Glossary)
2. Establish consistent ID patterns for all entities (Books, Chapters, Bundles, Readers, etc.)
3. Map how entities relate to each other (Books ↔ Chapters, Bundles ↔ Books, etc.)
4. Define user roles and privacy rules
5. Verify that no undefined terms appear in later phase documentation

This phase ensures clarity, consistency, and prevents technical debt caused by ambiguous definitions.

---

## Tasks

### Task 0.1: Write Product Glossary
**Status**: [x] Complete  
**Description**: Create comprehensive glossary with clear meanings for all terms  
**Dependencies**: None  
**Deliverables**: 
- [x] Product Glossary document with 50+ terms defined
- [x] Terms organized by category (Core Entities, User Roles, Access Control, etc.)

### Task 0.2: Define Contract and Data ID Patterns
**Status**: [ ] In Progress  
**Description**: Establish consistent ID formats for all entities  
**Dependencies**: Task 0.1 (Glossary must exist)  
**Deliverables**: 
- [ ] ID pattern specification document
- [ ] Examples for each entity type
- [ ] Collision prevention strategy

### Task 0.3: Map Relationships Between Entities
**Status**: [ ] Not Started  
**Description**: Document how Books, Bundles, Chapters, and Readers interact  
**Dependencies**: Task 0.2 (IDs must be defined)  
**Deliverables**: 
- [ ] Entity Relationship Diagram (ERD)
- [ ] Relationship rules document
- [ ] Access inheritance rules

### Task 0.4: Create Privacy and Roles Table
**Status**: [ ] Not Started  
**Description**: Define what each role can see and do  
**Dependencies**: Task 0.1 (Roles must be defined in glossary)  
**Deliverables**: 
- [ ] Roles and permissions matrix
- [ ] Privacy level definitions
- [ ] Access control rules

### Task 0.5: Verify No Undefined Terms
**Status**: [ ] Not Started  
**Description**: Review all Phase 1-8 documentation for undefined terms  
**Dependencies**: Tasks 0.1-0.4 complete  
**Deliverables**: 
- [ ] Verification checklist
- [ ] List of any missing definitions
- [ ] Updated glossary if needed

---

## Key Definitions (Quick Reference)

For full definitions, see [Product Glossary](./literary-network-glossary.md).

**Core Entities**: Book, Chapter, Bundle  
**User Roles**: Reader, Author, Admin, Guest  
**Access**: Reader Access Token, Access Grant, Access Verification  
**Reading**: Proof of Read, Read Event  
**Reviews**: Review, Review Ledger, Reputation Snapshot, Rating  
**Lending**: Lending Rules, Loan Request, Active Loan, Loan Approval  
**Badges**: Achievement Badge, Attestation, Attestation Export  
**Metrics**: Metrics Counter, Public Dashboard  
**Safety**: Moderation Queue, Rate Limit, Spam, Abuse  

---

## Glossary References

All terms used in The Literary Network are defined in:
- **Product Glossary**: [literary-network-glossary.md](./literary-network-glossary.md)

---

## Next Phase Prerequisites

Phase 1 (Core Reader MVP) cannot begin until:
- [x] Task 0.1: Product Glossary complete
- [ ] Task 0.2: ID patterns defined
- [ ] Task 0.3: Entity relationships mapped
- [ ] Task 0.4: Roles and privacy table created
- [ ] Task 0.5: All terms verified

---

## Notes and Learnings

**2025-11-11**: 
- Created comprehensive glossary with 50+ terms
- Organized by category for easy reference
- Clarified that The Literary Network uses standard gas transactions (not gasless)
- Defined Base funding ladder progression
- Set up project directory structure

---

**Phase Completion Checklist:**
- [x] Task 0.1 complete
- [ ] Task 0.2 complete
- [ ] Task 0.3 complete
- [ ] Task 0.4 complete
- [ ] Task 0.5 complete
- [ ] All documentation reviewed
- [ ] Ready to proceed to Phase 1
