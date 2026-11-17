class CfTrezorSigner < Formula
  desc "Chainflip Trezor transaction signing tool"
  homepage "https://github.com/chainflip-io/cf-trezor-signer"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-arm64"
      sha256 "23a8035c5344c18f1616fb45fa33bd5b0a0b04eb6a977a5c33490f4cd18591f8"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-x64"
      sha256 "772abe72dcb03492e322e3007db0406ac1ef7720b177304323558b94b422e494"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-arm64"
      sha256 "aba3f554f69b7486faf62d0e49689fa65fd37b2404590138140ee28560783be4"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-x64"
      sha256 "765c48bcd633e612a8137289f6473182898c7f5182acc290d0c6d534a1589f88"
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
