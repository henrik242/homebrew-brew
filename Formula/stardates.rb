class Stardates < Formula
  desc "Convert between stardates and other calendar systems"
  homepage "https://github.com/henrik242/stardates"
  url "https://github.com/henrik242/stardates/archive/refs/tags/1.7.0.tar.gz"
  sha256 "d7ba409121e1ab13e3c07c45429d0a31c0b871b23afb3b515f8891de2175bfe1"
  license "BSD-4-Clause"

  def install
    system "make"
    bin.install "stardate"
    man1.install "stardate.1"
  end

  test do
    assert_equal "[-36]9350.00", shell_output("#{bin}/stardate 1970-01-01").strip
  end
end
