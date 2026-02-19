class CfTrezorSigner < Formula
  desc "Chainflip Trezor transaction signing tool"
  homepage "https://github.com/chainflip-io/cf-trezor-signer"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-arm64"
      sha256 "5115a5d538c3f69e1122372b4e8d98d9f079dd26a167648f7bd4e31e56121216"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-x64"
      sha256 "e52f28ffe17b64068c2f717f39ca5476d225bc1694a0e62b6c4d5cb93cd28243"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-arm64"
      sha256 "0c3dfc0ad26b9bf5e740b78998aaf2127c22f5f16f2adaf159d04a7ea467baf1"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-x64"
      sha256 "f9cf0a88b4ba197335e1215f2a148a104fc8b0651a8ca766b76de26c609d7850"
    end
  end

  def install
    binary_name = "cf-trezor-signer-darwin-arm64"  # Default, overridden by conditionals

    on_macos do
      on_arm { binary_name = "cf-trezor-signer-darwin-arm64" }
      on_intel { binary_name = "cf-trezor-signer-darwin-x64" }
    end
    on_linux do
      on_arm { binary_name = "cf-trezor-signer-linux-arm64" }
      on_intel { binary_name = "cf-trezor-signer-linux-x64" }
    end

    bin.install binary_name => "cf-trezor-signer"
  end

  test do
    system "#{bin}/cf-trezor-signer", "--help"
  end
end
