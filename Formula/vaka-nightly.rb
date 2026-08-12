class VakaNightly < Formula
  desc "Declarative egress firewall for Docker containers (nightly)"
  homepage "https://github.com/infrasecture/vaka"
  version "0.0.0-nightly.202608121906.66bc469a8ad7"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/66bc469a8ad7/vaka-brew-darwin-arm64.tar.gz"
    sha256 "c0a9448adc1df701febb8904e997323a6d5ef90c9539bf17ba1338626aa15e81"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/66bc469a8ad7/vaka-brew-darwin-amd64.tar.gz"
    sha256 "7393ec3fe68b2bda6237c68d696a000a16915671a02778e7f09b32b10bf58175"
  end

  def install
    bin.install "vaka"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
