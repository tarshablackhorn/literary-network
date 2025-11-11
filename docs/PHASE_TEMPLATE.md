# PHASE [N] — [PHASE NAME]

**Status**: [Not Started | In Progress | Complete]  
**Start Date**: [YYYY-MM-DD]  
**Completion Date**: [YYYY-MM-DD]  
**Phase Goals**: [Brief description of what this phase accomplishes]

---

## Overview

[Detailed description of the phase purpose and objectives]

---

## Tasks

### Task [N.1]: [Task Name]
**Status**: [ ] Not Started | [ ] In Progress | [x] Complete  
**Description**: [What needs to be done]  
**Dependencies**: [Any prerequisites or prior tasks]  
**Deliverables**: 
- [ ] Deliverable 1
- [ ] Deliverable 2

---

## Module Definitions

### Module Name: [e.g., Reader Access Token]

#### Purpose
[Plain English explanation of what this module does]

#### Inputs
| Input Name | Type | Description | Required |
|------------|------|-------------|----------|
| param1 | address | Description | Yes |
| param2 | uint256 | Description | No |

#### Outputs
| Output Name | Type | Description |
|-------------|------|-------------|
| result1 | bool | Description |
| result2 | bytes32 | Description |

#### State Changes
- [List any state modifications this module makes]
- [e.g., "Adds entry to accessTokens mapping"]

#### Events Emitted
- **EventName**(param1, param2): [Description]

#### Error Conditions
- **ErrorName**: [When this error occurs]

#### Access Control
- **Who can call**: [Reader | Author | Admin | Anyone]
- **Restrictions**: [Any limitations or requirements]

---

## Smart Contract Design

### Contract Name: [e.g., ReaderAccessContract]

```solidity
// Pseudocode or actual Solidity code
contract ContractName {
    // State variables
    
    // Events
    
    // Functions
}
```

#### Function Specifications

##### functionName(param1, param2)
**Visibility**: public | external | internal | private  
**Mutability**: view | pure | payable | nonpayable  
**Description**: [What the function does]  
**Parameters**:
- `param1` (type): Description
- `param2` (type): Description

**Returns**: Return type and description  
**Reverts**:
- If condition X: "Error message"

---

## Testing Plan

### Unit Tests
- [ ] Test case 1: [Description]
- [ ] Test case 2: [Description]
- [ ] Test case 3: [Description]

### Integration Tests
- [ ] Test scenario 1: [Description]
- [ ] Test scenario 2: [Description]

### Edge Cases
- [ ] Edge case 1: [Description]
- [ ] Edge case 2: [Description]

---

## Deployment Plan

### Prerequisites
- [ ] Item 1
- [ ] Item 2

### Deployment Steps
1. Step 1
2. Step 2
3. Step 3

### Verification Steps
1. Verification 1
2. Verification 2

### Deployment Addresses

#### Base Sepolia Testnet
- ContractName: `0x...`
- Deployed: [YYYY-MM-DD]
- Tx Hash: `0x...`

#### Base Mainnet
- ContractName: `0x...`
- Deployed: [YYYY-MM-DD]
- Tx Hash: `0x...`

---

## Documentation

### User-Facing Documentation
- [ ] How-to guide created
- [ ] Examples provided
- [ ] FAQ updated

### Developer Documentation
- [ ] API reference created
- [ ] Code comments added
- [ ] Architecture diagram created

---

## Glossary References

List all terms from the Product Glossary used in this phase:
- **Term 1**: [Brief reminder or link to glossary]
- **Term 2**: [Brief reminder or link to glossary]

---

## Next Phase Prerequisites

What must be completed in this phase before moving to the next phase:
- [ ] Prerequisite 1
- [ ] Prerequisite 2

---

## Notes and Learnings

[Space for documenting insights, challenges, decisions made during this phase]

---

**Phase Completion Checklist:**
- [ ] All tasks completed
- [ ] All tests passing
- [ ] Documentation complete
- [ ] Code reviewed
- [ ] Deployed (if applicable)
- [ ] Verified on block explorer (if applicable)
- [ ] No undefined terms in documentation
