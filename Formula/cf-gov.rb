class CfGov < Formula
  desc "Chainflip governance transaction submission tool"
  homepage "https://github.com/chainflip-io/cf-gov-js"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-arm64"
      sha256 "7dcc23b88151ce9adbf0219e49e78048f68b97a8ee5ff906591f11e901bb97b8"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-x64"
      sha256 "4a8875f853db3abdd00b95687c008f37d8b8a12bbab5ac6ab680cf607d8c9423"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-arm64"
      sha256 "e9d97090a5481bc7cb5615c223431f752469011d70625baf5b4e0b13be79cd53"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-x64"
      sha256 "b3c2aeb5dc738fe442ab8d4f9739fd439c19fef06dd53b062a4530e5cbe37d9d"
    end
  end

  def install
    binary_name = "cf-gov-darwin-arm64"  # Default, overridden by conditionals

    on_macos do
      on_arm { binary_name = "cf-gov-darwin-arm64" }
      on_intel { binary_name = "cf-gov-darwin-x64" }
    end
    on_linux do
      on_arm { binary_name = "cf-gov-linux-arm64" }
      on_intel { binary_name = "cf-gov-linux-x64" }
    end

    bin.install binary_name => "cf-gov"
  end

  def caveats
    <<~EOS
      cf-gov is a tool for submitting and approving Chainflip governance
      proposals. Consider installing cf-trezor-signer too.

      Quick start:
        cf-gov config --chain=berghain   # Set up local config
        cf-gov approve --chain=b         # Get a list of proposals and optionally approve
    EOS
  end

  test do
    system "#{bin}/cf-gov", "--help"
  end
end
