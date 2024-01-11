class Procenv < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/procenv"
  url "https://github.com/henrik242/procenv/archive/refs/tags/1.2.tar.gz"
  sha256 "48b70f7a842b48098d8317f1f2f3cc1d7427537718df6561750d0ee3f502c5d0"
  license "MIT"

  def install
    system "make"
    bin.install "procenv"
  end

  test do
    assert_equal "Unaccessible or missing PID: 1234567890", shell_output("#{bin}/procenv 1234567890").strip
  end
end
