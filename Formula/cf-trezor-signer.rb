class CfTrezorSigner < Formula
  desc "Chainflip Trezor transaction signing tool"
  homepage "https://github.com/chainflip-io/cf-trezor-signer"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-darwin-arm64"
      sha256 "e919aefff38e9d82fa384b0015897a243e57762eafa2238cb658a3720891a342"
    end
    on_intel do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-darwin-x64"
      sha256 "06a6d75130d02ad6cb8f31f464c4a565b8301a3358514d0cda7ba8a2a6f8fd06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-linux-arm64"
      sha256 "66da9958c6c6cd8624d8cf458ce8fc8c9d66b51f3ea663ff64040aafb68010cb"
    end
    on_intel do
      url "https://github.com/chainflip-io/cf-trezor-signer/releases/download/v#{version}/cf-trezor-signer-linux-x64"
      sha256 "dbe7f9ee541fd777a1b769f536625b67fb077c7ec5f79070524ea317bb34486b"
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
