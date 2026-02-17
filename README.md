# Chainflip Homebrew Tap

Homebrew tap for Chainflip CLI tools.

## Installation

```bash
brew tap chainflip-io/tap
```

## Available Formulae

### cf-gov

Chainflip governance transaction submission tool.

**Install:**

```bash
brew install chainflip-io/tap/cf-gov
```

**Upgrade:**

```bash
brew upgrade cf-gov
```

### cf-trezor-signer

Chainflip Trezor transaction signing tool.

**Install:**

```bash
brew install chainflip-io/tap/cf-trezor-signer
```

**Upgrade:**

```bash
brew upgrade cf-trezor-signer
```

## For Maintainers

### Automated Updates

Formula updates are automated via a generic GitHub Actions workflow that works for any formula in this tap. It downloads the release binaries, computes SHA256 hashes, and updates the formula file automatically.

**Manual Trigger:**

```bash
gh workflow run update-formula.yml \
  --repo chainflip-io/homebrew-tap \
  --ref main \
  --field formula="cf-gov" \
  --field source_repo="chainflip-io/cf-gov-js" \
  --field version="0.1.0" \
  --field tag="v0.1.0"
```

```bash
gh workflow run update-formula.yml \
  --repo chainflip-io/homebrew-tap \
  --ref main \
  --field formula="cf-trezor-signer" \
  --field source_repo="chainflip-io/cf-trezor-signer" \
  --field version="0.1.0" \
  --field tag="v0.1.0"
```

**Calling from a source repo's release workflow:**

You can also trigger this from a source repo's GitHub Actions (e.g., on release publish) by adding a step like:

```yaml
- name: Update Homebrew formula
  run: |
    gh workflow run update-formula.yml \
      --repo chainflip-io/homebrew-tap \
      --ref main \
      --field formula="<formula-name>" \
      --field source_repo="${{ github.repository }}" \
      --field version="${{ github.event.release.tag_name }}" \
      --field tag="${{ github.event.release.tag_name }}"
  env:
    GH_TOKEN: ${{ secrets.HOMEBREW_TAP_UPDATE_TOKEN }}
```

This requires a PAT with `repo` scope stored as `HOMEBREW_TAP_UPDATE_TOKEN` in the source repository.

### Manual Formula Updates

If automation is unavailable, update manually:

1. Update the `version` field in the formula
2. Update all `url` fields with the new version tag
3. Calculate and update all `sha256` values:

   ```bash
   shasum -a 256 <downloaded-binary>
   ```

### Adding New Tools

Add new formulae as separate `.rb` files in the `Formula/` directory. Each formula should follow the same structure as `cf-gov.rb`.

## Why Use This Tap?

Homebrew automatically clears macOS quarantine attributes during installation, preventing the "damaged app" Gatekeeper error that occurs when downloading binaries directly from GitHub releases.
