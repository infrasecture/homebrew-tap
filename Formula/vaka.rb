class Vaka < Formula
  desc "Declarative egress firewall for Docker containers"
  homepage "https://github.com/infrasecture/vaka"
  url "https://github.com/infrasecture/vaka.git",
      using: :git,
      revision: "c08add125d252ccaba133d755070c36ce0381b8b"
  version "0.0.0"
  license "LGPL-2.1-only"

  depends_on "go" => :build

  def install
    commit = Utils.safe_popen_read("git", "rev-parse", "--short", "HEAD").strip
    ldflags = %W[
      -s
      -w
      -X
      main.version=#{commit}
    ]

    system "go", "build", *std_go_args(ldflags:), "./cmd/vaka"
  end

  test do
    output = shell_output("#{bin}/vaka version")
    assert_match "vaka ", output
  end
end
