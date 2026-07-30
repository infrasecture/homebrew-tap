class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  version "0.1.1"
  license "LGPL-2.1-only"

  on_arm do
    url "https://github.com/infrasecture/vaka/releases/download/v0.1.1/vaka-brew-darwin-arm64.tar.gz"
    sha256 "14eb3fe99f9a4a649d0714396df67143c00c008b51605d6b61c21aa276f8cd28"
  end

  on_intel do
    url "https://github.com/infrasecture/vaka/releases/download/v0.1.1/vaka-brew-darwin-amd64.tar.gz"
    sha256 "6540a765334689f1a283bff2dd9e772a74708415be56d5671974271951c09fbf"
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
