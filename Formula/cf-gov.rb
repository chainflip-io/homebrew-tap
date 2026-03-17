class CfGov < Formula
  desc "Chainflip governance transaction submission tool"
  homepage "https://github.com/chainflip-io/cf-gov-js"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-arm64"
      sha256 "dbcf60b95dde4e256a648b3f28038bc0a063e4c834add3fdd8e853d712811104"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-x64"
      sha256 "804ec7ce2b075541ddd8641601895c10186437a419264c42d8f7a5811e52f026"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-arm64"
      sha256 "7b89dc72fac8b069a5d6e2fc6078af49a1f5bed4dd4a16d70b89f638024ad3c8"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-x64"
      sha256 "8af74603c855e0fc4e546eab1cf8557fde48bb9c6d8a42d848a9eac5420f5ed5"
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
