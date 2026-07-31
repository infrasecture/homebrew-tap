class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.2.0"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.2.0/vaka-brew-darwin-arm64.tar.gz"
    sha256 "73215ad98dcbbbe964e0252abc5ae9b48f4196a724af9c15a14ec9cd5b21df74"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.2.0/vaka-brew-darwin-amd64.tar.gz"
    sha256 "641935d417eb01d7aec90d83e001f8e7463e9647a3be7889f9dadb3e890bbb3d"
  end

  def install
    bin.install "vaka"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
