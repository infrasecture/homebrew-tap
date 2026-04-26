class VakaNightly < Formula
  desc "Declarative egress firewall for Docker containers (nightly)"
  homepage "https://github.com/infrasecture/vaka"
  version "0.0.0-nightly.202604262201.5f6b1f19ef86"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/5f6b1f19ef86/vaka-brew-darwin-arm64.tar.gz"
    sha256 "636430b74acd2083ab84216ebbad252cb6b6c4f4900cd21532ff1c9c0901b3cc"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/5f6b1f19ef86/vaka-brew-darwin-amd64.tar.gz"
    sha256 "2d3fa5ee394de88bcaf7743f7f9767b3a927a6daa61be156bea247360da91138"
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
