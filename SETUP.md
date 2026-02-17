# Homebrew Tap Setup Guide

Complete setup instructions for the Chainflip Homebrew tap with automated formula updates.

## Step 1: Create the GitHub Repository

```bash
cd homebrew-tap
git init
git add .
git commit -m "Initial Homebrew tap setup for cf-gov"

# Create private repo in chainflip-io org
gh repo create chainflip-io/homebrew-tap \
  --private \
  --source=. \
  --push \
  --description "Private Homebrew tap for Chainflip CLI tools"
```

## Step 2: Update SHA256 Hashes

Before users can install, you need real SHA256 values from the v0.1.0 release:

```bash
# Download the binaries from the latest cf-gov-js release
VERSION="v0.1.0"  # Adjust as needed
mkdir -p /tmp/cf-gov-binaries
cd /tmp/cf-gov-binaries

gh release download "$VERSION" \
  --repo chainflip-io/cf-gov-js \
  --pattern "cf-gov-*"

# Calculate hashes
echo "darwin-arm64: $(shasum -a 256 cf-gov-darwin-arm64 | awk '{print $1}')"
echo "darwin-x64:   $(shasum -a 256 cf-gov-darwin-x64 | awk '{print $1}')"
echo "linux-arm64:  $(shasum -a 256 cf-gov-linux-arm64 | awk '{print $1}')"
echo "linux-x64:    $(shasum -a 256 cf-gov-linux-x64 | awk '{print $1}')"
```

Update the `PLACEHOLDER` values in `Formula/cf-gov.rb` with these hashes, then commit:

```bash
cd ~/Work/chainflip/homebrew-tap
git add Formula/cf-gov.rb
git commit -m "Add SHA256 hashes for v0.1.0"
git push
```

## Step 3: Set Up Automation

### 3a. Create GitHub Token

1. Go to https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Name: `Homebrew Tap Updates`
4. Select scopes:
   - `repo` (all)
   - `workflow`
5. Generate and copy the token

### 3b. Add Secret to cf-gov-js Repository

```bash
# Add the token as a secret
gh secret set HOMEBREW_TAP_UPDATE_TOKEN \
  --repo chainflip-io/cf-gov-js \
  --body "YOUR_TOKEN_HERE"
```

### 3c. Add Workflow to cf-gov-js

Copy the trigger workflow to the cf-gov-js repository:

```bash
# Assuming cf-gov-js is cloned locally
cp ~/Work/chainflip/homebrew-tap-trigger-workflow.yml \
   ~/path/to/cf-gov-js/.github/workflows/update-homebrew-formula.yml

cd ~/path/to/cf-gov-js
git add .github/workflows/update-homebrew-formula.yml
git commit -m "Add Homebrew formula auto-update workflow"
git push
```

## Step 4: Test the Setup

### Test Manual Installation

```bash
# Add the tap (requires org access and gh auth)
brew tap chainflip-io/tap

# Install cf-gov
brew install chainflip-io/tap/cf-gov

# Verify
cf-gov --help
```

### Test Automation

Trigger the workflow manually to test:

```bash
gh workflow run update-formula.yml \
  --repo chainflip-io/homebrew-tap \
  --ref main \
  --field version="0.1.0" \
  --field tag="v0.1.0"

# Check workflow status
gh run list --repo chainflip-io/homebrew-tap --workflow=update-formula.yml
```

## Ongoing Usage

Once set up, the formula automatically updates when you publish a new release in `cf-gov-js`. Users can upgrade with:

```bash
brew upgrade cf-gov
```

## Troubleshooting

### Users get "damaged app" error

This shouldn't happen with Homebrew installation. If it does, have them run:
```bash
xattr -cr $(which cf-gov)
```

### Formula update workflow fails

Check:
- The `HOMEBREW_TAP_UPDATE_TOKEN` secret exists and is valid
- The token has `repo` and `workflow` scopes
- The release includes all four binary assets with exact names from the formula
