class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.0.2"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.0.2/vaka-brew-darwin-arm64.tar.gz"
    sha256 "d91cd2f7bd9ee893e675a2db1dcf2b8c1892079a5ac4d53b7b1c8528471ed878"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.0.2/vaka-brew-darwin-amd64.tar.gz"
    sha256 "dfa3e72e5c19d689ba14a1e307d7c233b12c0de8e2485cac96f95cfced0d1b8f"
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
