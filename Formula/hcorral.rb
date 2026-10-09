class Hcorral < Formula
  desc "Persistent AI development workstations in Docker"
  homepage "https://github.com/infrasecture/hcorral"
  license "AGPL-3.0-or-later"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/infrasecture/hcorral/releases/download/v0.2.0/hcorral_0.2.0_darwin_arm64.tar.gz"
    sha256 "9c240eca92edee7d15b0cf96b915ffd5bd2d59359a49130b7e674fe6fdd3a7f0"
  else
    url "https://github.com/infrasecture/hcorral/releases/download/v0.2.0/hcorral_0.2.0_darwin_amd64.tar.gz"
    sha256 "1272c67f5e360a3c59d5419f013f533aa866dbfbc61f53913ad9e130719c2593"
  end

  def install
    bin.install "hcorral"
  end

  test do
    output = shell_output("#{bin}/hcorral version")
    assert_match "hcorral v0.2.0", output
  end
end
