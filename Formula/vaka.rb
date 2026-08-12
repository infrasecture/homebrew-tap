class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.3.1"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.3.1/vaka-brew-darwin-arm64.tar.gz"
    sha256 "70914519824b014b3e61113d0bd96ca6303d5f3bec728e8d02e23be71b53eb7c"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.3.1/vaka-brew-darwin-amd64.tar.gz"
    sha256 "a2399f9c9b197d79bc937c9037763cb9c7c437fb049a313bbb90cd79c931590d"
  end

  def install
    bin.install "vaka"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
