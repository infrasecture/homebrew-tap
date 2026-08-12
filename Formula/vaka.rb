class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.3.3"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.3.3/vaka-brew-darwin-arm64.tar.gz"
    sha256 "a20ebd5d4b1ae3d712fdcfd00e5de435f03d937c090f3b3c5a36c9799ff4cd0c"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.3.3/vaka-brew-darwin-amd64.tar.gz"
    sha256 "ba1c88b3d4fc0393732355b531add05783daf2b66d5684f6816dbd1f88dd9b6b"
  end

  def install
    bin.install "vaka"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
