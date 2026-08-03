class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.3.0"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.3.0/vaka-brew-darwin-arm64.tar.gz"
    sha256 "056ad13625df95549d6721dfbce88613ada884032043b59e691ecc95bb169e04"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.3.0/vaka-brew-darwin-amd64.tar.gz"
    sha256 "e2224471a43288d50f2cbed6611b094a584e440cda230548c2bb1385a2b77e36"
  end

  def install
    bin.install "vaka"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
