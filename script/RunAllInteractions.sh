#!/bin/bash

# Run all Phase 1 interactions in chronological order
# This script executes 5+ on-chain transactions for Weekly Rewards proof

set -e

echo "======================================"
echo "Phase 1 - Running All Interactions"
echo "======================================"
echo ""

# Check for .env file
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found"
    echo "Please create .env with PRIVATE_KEY"
    exit 1
fi

echo "📝 Interaction 1: Grant Access to Reader"
echo "--------------------------------------"
forge script script/Interact1_GrantAccess.s.sol:Interact1_GrantAccess \
    --rpc-url base-sepolia \
    --broadcast \
    -vvv
echo ""
echo "✅ Interaction 1 complete!"
echo ""
sleep 3

echo "📝 Interaction 2: Record Proof of Read"
echo "--------------------------------------"
forge script script/Interact2_RecordRead.s.sol:Interact2_RecordRead \
    --rpc-url base-sepolia \
    --broadcast \
    -vvv
echo ""
echo "✅ Interaction 2 complete!"
echo ""
sleep 3

echo "📝 Interaction 3: Verify Access (Read-only)"
echo "--------------------------------------"
forge script script/Interact3_VerifyAccess.s.sol:Interact3_VerifyAccess \
    --rpc-url base-sepolia \
    -vvv
echo ""
echo "✅ Interaction 3 complete!"
echo ""
sleep 3

echo "📝 Interaction 4: Get Reading History (Read-only)"
echo "--------------------------------------"
forge script script/Interact4_GetHistory.s.sol:Interact4_GetHistory \
    --rpc-url base-sepolia \
    -vvv
echo ""
echo "✅ Interaction 4 complete!"
echo ""
sleep 3

echo "📝 Interaction 5: Revoke Access"
echo "--------------------------------------"
forge script script/Interact5_RevokeAccess.s.sol:Interact5_RevokeAccess \
    --rpc-url base-sepolia \
    --broadcast \
    -vvv
echo ""
echo "✅ Interaction 5 complete!"
echo ""

echo "======================================"
echo "🎉 All interactions completed!"
echo "======================================"
echo ""
echo "Summary:"
echo "- Interaction 1: Granted access ✅"
echo "- Interaction 2: Recorded read ✅"
echo "- Interaction 3: Verified access ✅"
echo "- Interaction 4: Got reading history ✅"
echo "- Interaction 5: Revoked access ✅"
echo ""
echo "📊 Check Base Sepolia BaseScan for transaction details"
echo "🔗 https://sepolia.basescan.org/address/0x8281c89d998cFb355535dC702CDBE8FC831c42a5"
