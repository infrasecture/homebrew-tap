class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.0.1"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.0.1/vaka-brew-darwin-arm64.tar.gz"
    sha256 "c78f18d284d13a1b80235cfe6180c3255d6abd7c2d13ebe07ea5375ea258608d"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.0.1/vaka-brew-darwin-amd64.tar.gz"
    sha256 "4c2ae2c3b5426b4a2b2b05ed11fc0c334e40c030ddb3cf341d77ff30cda24bb4"
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
