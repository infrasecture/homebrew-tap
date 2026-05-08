class VakaNightly < Formula
  desc "Declarative egress firewall for Docker containers (nightly)"
  homepage "https://github.com/infrasecture/vaka"
  version "0.0.0-nightly.202605081655.6813c4a0ea0a"
  license "LGPL-2.1-only"

  conflicts_with "vaka", because: "vaka and vaka-nightly install the same commands: vaka and vaka-init"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/6813c4a0ea0a/vaka-brew-darwin-arm64.tar.gz"
    sha256 "14a93bcb2fe7cfd2c9ef8af936bdd12bf27f08950fefecb1d51e5904cf22711e"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/6813c4a0ea0a/vaka-brew-darwin-amd64.tar.gz"
    sha256 "dce650cebe754471a49ddfee30a43a8aa36dd121432a2906340541f622b73109"
  end

  def install
    bin.install "vaka"
    bin.install "vaka-init"
  end

  def caveats
    <<~EOS
      vaka and vaka-nightly install the same commands: vaka and vaka-init.
      Only one channel should be linked at a time.

      To switch from stable to nightly:
        brew unlink vaka
        brew install vaka-nightly

      If nightly is already installed but unlinked:
        brew link vaka-nightly
    EOS
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
