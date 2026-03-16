class Envps < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/envps"
  url "https://github.com/henrik242/envps/archive/refs/tags/2.0.1.tar.gz"
  sha256 "882f4a5011e437cbcdb20d7f148dba574713dfc2094d91060474f74f54d001eb"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "make"
    bin.install "envps"
  end

  test do
    assert_equal "Unaccessible or missing PID: 1234567890", shell_output("#{bin}/envps 1234567890 2>&1").strip
    assert_equal "Illegal PID: FOO", shell_output("#{bin}/envps FOO 2>&1", 1).strip
  end
end
