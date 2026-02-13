class Envps < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/envps"
  url "https://github.com/henrik242/envps/archive/refs/tags/1.5.tar.gz"
  sha256 "af8b854153d04495eac92a73233c1162e5212b1e2b95af0ef9de48dbd73167bd"
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
