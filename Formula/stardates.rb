class Stardates < Formula
  desc "Displays date in 5 formats (including stardate of course)"
  homepage "https://github.com/henrik242/stardates"
  url "https://github.com/henrik242/stardates/archive/refs/tags/1.6.1.tar.gz"
  sha256 "aa7ab49342cd7356f0ae2b05a0823052df84e76de471ef796d157eec17491625"
  license "BSD-4-Clause"

  def install
    system "make"
    bin.install "stardate"
    man1.install "stardate.1"
  end

  bottle do
    root_url "https://github.com/henrik242/homebrew-brew/releases/download/1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d947eb7a0989eb66cd82aa15304aa7aa0d49b4c42bb09b2390d0d317159289e6"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c5b3472de49343451086db70dab5fbb54829af36543a44a281e08b9e90e3dcd7"
  end

  test do
    assert_equal "[-36]9350.00", shell_output("#{bin}/stardate 1970-01-01").strip
  end
end
