class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.1.2"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.1.2/vaka-brew-darwin-arm64.tar.gz"
    sha256 "042ef8b8c10f0c3c9e205fa242458c48029d9a8794d93aad5cfc33c4f9cfada9"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.1.2/vaka-brew-darwin-amd64.tar.gz"
    sha256 "523b785a18346470f25879c9c18366c516707a5fa9d725129bbdbbc9bcc48a64"
  end

  def install
    bin.install "vaka"
    bin.install "vaka-init"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
