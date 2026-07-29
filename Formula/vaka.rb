class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.1.0"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.1.0/vaka-brew-darwin-arm64.tar.gz"
    sha256 "c1f9fd79a225b522960d009f7369d1c7da4b6443468787aa16cf7f2154db099e"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.1.0/vaka-brew-darwin-amd64.tar.gz"
    sha256 "37739066ff371bae8f77369c64c87e6fbf79ff8b570234d329ef70161b649862"
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
