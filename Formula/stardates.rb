class Procenv < Formula
  desc "Displays date in 5 formats (including stardate of course)"
  homepage "https://github.com/henrik242/stardates"
  url "https://github.com/henrik242/stardates/archive/refs/tags/1.6.1.tar.gz"
  sha256 "aa7ab49342cd7356f0ae2b05a0823052df84e76de471ef796d157eec17491625"
  license "BSD4CLAUSE"

  def install
    system "make"
    bin.install "stardate"
    man1.install "stardate.1"
  end

  test do
    assert_equal "[-36]9350.00", shell_output("#{bin}/stardate 1970-01-01").strip
  end
end
