class Hcorral < Formula
  desc "Persistent AI development workstations in Docker"
  homepage "https://github.com/infrasecture/hcorral"
  version "0.1.0"
  license "AGPL-3.0-or-later"
  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/infrasecture/hcorral/releases/download/v0.1.0/hcorral_0.1.0_darwin_arm64.tar.gz"
    sha256 "736c98d12b5fb8fe21ab160b7d8a038de146d24020c7f08dc17ac5fa422c2ed6"
  else
    url "https://github.com/infrasecture/hcorral/releases/download/v0.1.0/hcorral_0.1.0_darwin_amd64.tar.gz"
    sha256 "955ce7398721b055deb34085e7ccfde7eb2a87edaa4d893dfd22b9035cd0c6d8"
  end

  def install
    bin.install "hcorral"
  end

  test do
    output = shell_output("#{bin}/hcorral version")
    assert_match "hcorral v0.1.0", output
  end
end
