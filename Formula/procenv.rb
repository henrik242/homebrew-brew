class Procenv < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/procenv"
  url "https://github.com/henrik242/procenv/archive/refs/tags/1.0.tar.gz"
  sha256 "6ff4c45b648d8c5b703d48620ef9425d30215488cd1dfc8e75a9bd57b8b557dc"
  license "MIT"

  def install
    system "make"
    bin.install "procenv"
  end

  test do
    system "#{bin}/procenv"
  end
end
