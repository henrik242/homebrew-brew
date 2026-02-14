class Envps < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/envps"
  url "https://github.com/henrik242/envps/archive/refs/tags/1.6.tar.gz"
  sha256 "4d8f4787ee99f610d68bd4fd53f81b32a592013b8e2c1f2c91ef6f5f9e20bc5e"
  license "MIT"

  def install
    system "make"
    bin.install "envps"
  end

  test do
    assert_equal "Unaccessible or missing PID: 1234567890", shell_output("#{bin}/envps 1234567890 2>&1", 1).strip
    assert_equal "Illegal PID: FOO", shell_output("#{bin}/envps FOO 2>&1", 1).strip
  end
end
