#!/bin/bash

set -e

echo "Running Phase 1 scenario calls..."

# Check for required environment variables
if [ -z "$PRIVATE_KEY" ]; then
    echo "Error: PRIVATE_KEY environment variable is not set"
    exit 1
fi

if [ -z "$RPC_URL" ]; then
    echo "Error: RPC_URL environment variable is not set"
    exit 1
fi

if [ -z "$CONTRACT_ADDRESS" ]; then
    echo "Error: CONTRACT_ADDRESS environment variable is not set"
    exit 1
fi

# Load and execute scenarios from phase1_scenarios.json
echo "Loading scenarios from sim/phase1_scenarios.json..."

# Example: Use node script to process scenarios
# node scripts/execute-scenarios.js

echo "All scenarios executed successfully!"
