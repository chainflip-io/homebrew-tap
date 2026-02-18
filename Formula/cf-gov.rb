class CfGov < Formula
  desc "Chainflip governance transaction submission tool"
  homepage "https://github.com/chainflip-io/cf-gov-js"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-arm64"
      sha256 "f332aedca1e4f9b76545f341a7c068a1341e2104220996c89f40800b932aba86"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-x64"
      sha256 "9348495b8dd508dc740fc64552a10375db444a3001a00a6b8ed2b107fc560913"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-arm64"
      sha256 "7cd4f6956c05fb1402f9837c70421136274e000206a769c01d82f6798f28c076"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-x64"
      sha256 "01f01683768159ebf1210b9e499edae1bc94b201701adf743916e2af6b864399"
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

  test do
    system "#{bin}/cf-gov", "--help"
  end
end
