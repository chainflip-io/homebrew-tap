class CfGov < Formula
  desc "Chainflip governance transaction submission tool"
  homepage "https://github.com/chainflip-io/cf-gov-js"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chainflip-io/cf-gov-js/releases/download/v#{version}/cf-gov-darwin-arm64"
      sha256 "730b70ff5f6ac9730e4e360f7c92074ba93f49a87d33d8fcb6fcbdae2e724307"
    end
    on_intel do
      url "https://github.com/chainflip-io/cf-gov-js/releases/download/v#{version}/cf-gov-darwin-x64"
      sha256 "324f5f9b06fa888d9a539338135de122435840e92733e28a03cc5b70079b6bcc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chainflip-io/cf-gov-js/releases/download/v#{version}/cf-gov-linux-arm64"
      sha256 "673d4692c9c9630978cf443c9c85b894add16be45e65a356cbc82ee2fbf468a1"
    end
    on_intel do
      url "https://github.com/chainflip-io/cf-gov-js/releases/download/v#{version}/cf-gov-linux-x64"
      sha256 "813e3f2d79cae4c9347e8dbff73901072f3a9f7f96a57c1246d3a6b5f2b83869"
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
