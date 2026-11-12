class CfTrezorSigner < Formula
  desc "Chainflip Trezor transaction signing tool"
  homepage "https://github.com/chainflip-io/cf-trezor-signer"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-arm64"
      sha256 "930b4f2b281351aa1be5157e7ae6752e10369edf7d71c8f2a595d52f28b9d7a5"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-x64"
      sha256 "c1e20851dc5560040b5c397e8c179f121663df97bfce356cab9f872940acf04e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-arm64"
      sha256 "9d4f25d05663289017dfd9616fcf368826ccbca7e4bfef2381e768e9d69eff99"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-x64"
      sha256 "58ca6d8308d50e39ccd06ac6812b25b756c496d755fec041107e44f5c9ca8d59"
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
