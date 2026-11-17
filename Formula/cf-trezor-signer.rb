class CfTrezorSigner < Formula
  desc "Chainflip Trezor transaction signing tool"
  homepage "https://github.com/chainflip-io/cf-trezor-signer"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-arm64"
      sha256 "ba5f022598fa3d0782cad34c193f0c4cef0ff4edf04c3bf8ac455e873b9decc4"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-darwin-x64"
      sha256 "8d4469083dec60120fe975356d1f31a0e1b1fed30754f22bf322eb97bbf7f076"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-arm64"
      sha256 "827c97d94d736e9f65e1a69f231176a89b53c516cc555de8461ce386957b9971"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-trezor-signer-v#{version}/cf-trezor-signer-linux-x64"
      sha256 "d11680beebaa6de9f2d35837302be6655720b0822ddf0d038587fe6458fda3e0"
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
