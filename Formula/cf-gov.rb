class CfGov < Formula
  desc "Chainflip governance transaction submission tool"
  homepage "https://github.com/chainflip-io/cf-gov-js"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-arm64"
      sha256 "07f1f10a114a48c4dcfc204c02fc4b5519c65bdd06e27f32e0b057783ce035a5"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-x64"
      sha256 "4d3c575d2d064ff196548ade412f47f36291141b4cb33ddaf45b2a84cb0a70db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-arm64"
      sha256 "67de647c54429ba59c182158f914bfdaa10023276fef6451f0a6dd4c43e0e8e7"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-x64"
      sha256 "78a3cc0810717149b26d0cb7861f58aabf063ce554438b59e9b38fdd9f2afc55"
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
