class CfTrezorSigner < Formula
  desc "Chainflip Trezor transaction signing tool"
  homepage "https://github.com/chainflip-io/cf-trezor-signer"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-darwin-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-darwin-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-linux-arm64"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-linux-x64"
      sha256 "PLACEHOLDER"
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
