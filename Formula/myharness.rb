class Myharness < Formula
  desc "Profile-driven containerized workstation for autonomous coding agents"
  homepage "https://github.com/infrasecture/myHarness"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/infrasecture/myHarness/releases/download/v0.1.0/myharness-brew-darwin-arm64.tar.gz"
      sha256 "33907660e880a409f0bb728a05e5ef49f28aba21f89444161156d608f6888f7a"
    else
      url "https://github.com/infrasecture/myHarness/releases/download/v0.1.0/myharness-brew-darwin-amd64.tar.gz"
      sha256 "5a7a03451f4921ef6cc8c7db24cb0a15f7fb503a21b919a3919259e18b9c81ca"
    end
  end

  def install
    bin.install "myharness"
    bin.install "myCodex"
    bin.install "myClaude"
    bin.install "myOpenCode"
    bin.install "myHermes"
  end

  test do
    output = shell_output("#{bin}/myharness version")
    assert_match "myharness ", output
  end
end
