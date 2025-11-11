# Phase 1 Deployment Guide

## Prerequisites

✅ Foundry installed  
✅ Contracts written (AccessToken.sol, ProofOfRead.sol)  
✅ Deployment script created (DeployPhase1.s.sol)

## Step-by-Step Deployment

### 1. Set Up Environment Variables

Copy `.env.example` to `.env`:
```bash
cp .env.example .env
```

Edit `.env` and fill in:
- `PRIVATE_KEY`: Your wallet's private key (without 0x prefix)
- `BASESCAN_API_KEY`: Get from https://basescan.org/myapikey (optional, for verification)

### 2. Get Base Sepolia ETH

You need testnet ETH to deploy. Get it from a faucet:

**Option 1: Base Faucet (Recommended)**
- Visit: https://www.coinbase.com/faucets/base-ethereum-sepolia-faucet
- Connect your wallet
- Request Base Sepolia ETH

**Option 2: Bware Labs Faucet**
- Visit: https://bwarelabs.com/faucets/base-sepolia
- Enter your address
- Request testnet ETH

**Option 3: Alchemy Faucet**
- Visit: https://www.alchemy.com/faucets/base-sepolia
- Sign in and request ETH

You'll need approximately 0.01 ETH for deployment.

### 3. Check Your Balance

```bash
cast balance YOUR_ADDRESS --rpc-url base-sepolia
```

### 4. Deploy Contracts

Run the deployment script:

```bash
forge script script/DeployPhase1.s.sol:DeployPhase1 \
  --rpc-url base-sepolia \
  --broadcast \
  --verify \
  -vvvv
```

**Flags explained:**
- `--broadcast`: Actually send the transactions (without this, it's a simulation)
- `--verify`: Automatically verify contracts on BaseScan
- `-vvvv`: Verbose output for debugging

### 5. Save Deployment Information

After deployment, you'll see output like:

```
AccessToken deployed to: 0x1234...
ProofOfRead deployed to: 0x5678...
```

**Copy these addresses!** You'll need them for:
- `deploy/phase1_deploy.json`
- README updates
- Weekly Rewards submission

### 6. Verify Contracts (if auto-verify failed)

If automatic verification didn't work, verify manually:

```bash
# Verify AccessToken
forge verify-contract \
  YOUR_ACCESS_TOKEN_ADDRESS \
  src/AccessToken.sol:AccessToken \
  --chain-id 84532 \
  --watch

# Verify ProofOfRead
forge verify-contract \
  YOUR_PROOF_OF_READ_ADDRESS \
  src/ProofOfRead.sol:ProofOfRead \
  --chain-id 84532 \
  --watch
```

### 7. View Contracts on BaseScan

Visit:
- AccessToken: `https://sepolia.basescan.org/address/YOUR_ACCESS_TOKEN_ADDRESS`
- ProofOfRead: `https://sepolia.basescan.org/address/YOUR_PROOF_OF_READ_ADDRESS`

---

## Troubleshooting

### "Insufficient funds"
- Get more Base Sepolia ETH from a faucet
- Check balance: `cast balance YOUR_ADDRESS --rpc-url base-sepolia`

### "Nonce too low/high"
- Reset nonce: Add `--with-gas-price 1gwei` to force override

### "Verification failed"
- Make sure `BASESCAN_API_KEY` is set in `.env`
- Try manual verification (see Step 6)
- Verification can take a few minutes

### "RPC error"
- Public RPC might be rate-limited
- Try again in a few minutes
- Or use a dedicated RPC from Alchemy/Infura

---

## After Deployment Checklist

- [ ] Save contract addresses
- [ ] Verify both contracts on BaseScan
- [ ] Update `deploy/phase1_deploy.json`
- [ ] Update README with contract links
- [ ] Take screenshots of BaseScan pages
- [ ] Commit deployment info to GitHub

---

## Quick Deploy Command (After .env is set up)

```bash
# Load environment variables
source .env

# Deploy with verification
forge script script/DeployPhase1.s.sol:DeployPhase1 \
  --rpc-url base-sepolia \
  --broadcast \
  --verify \
  -vvvv
```

---

## Network Information

- **Network Name**: Base Sepolia
- **Chain ID**: 84532
- **RPC URL**: https://sepolia.base.org
- **Explorer**: https://sepolia.basescan.org
- **Currency**: ETH (testnet)

---

**Ready to deploy?** Make sure you have:
1. ✅ `.env` file with PRIVATE_KEY
2. ✅ Base Sepolia ETH in your wallet
3. ✅ Contracts compiled (`forge build`)

Then run the deploy command!
