class CfGov < Formula
  desc "Chainflip governance transaction submission tool"
  homepage "https://github.com/chainflip-io/cf-gov-js"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-arm64"
      sha256 "55a6b9499f309eab748ece9cc4177c92864ea02c110c9eb8070678fa7e5c25e0"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-darwin-x64"
      sha256 "6a47188b655a411550c3d7f8aee5c387ef6360e669a631749179eec8c1304e75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-arm64"
      sha256 "7555fbc782dbfb7b8b89594e32a8d2e471428c0429981966de65ca4ac402f793"
    end
    on_intel do
      url "https://github.com/chainflip-io/homebrew-tap/releases/download/cf-gov-v#{version}/cf-gov-linux-x64"
      sha256 "e96c32d991f2347263b536680c10be1dd999a182e84ee31d9eb85642bbc68bc4"
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
