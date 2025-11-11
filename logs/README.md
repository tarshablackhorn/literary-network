# Logs Directory

This directory contains logs from GitHub Actions workflows and contract interactions.

## Files

- `deploy.log` - Deployment logs from GitHub Actions workflow
- `calls.log` - On-chain interaction logs from GitHub Actions workflow

## How to Generate Logs

### Deployment Logs

1. Go to GitHub Actions → "Deploy Phase 1 Contracts"
2. Click on the completed workflow run
3. Download the artifacts or copy the logs from the "Deploy contracts" step
4. Save to `logs/deploy.log`

### Interaction Logs

1. Go to GitHub Actions → "Run Phase 1 Calls"
2. Click on the completed workflow run
3. Download the artifacts or copy the logs from the "Run Phase 1 scenarios" step
4. Save to `logs/calls.log`

## Notes

Keep these logs for Weekly Rewards proof. They demonstrate that your contracts were deployed and tested via automated CI/CD.
