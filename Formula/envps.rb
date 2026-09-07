class Envps < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/envps"
  url "https://github.com/henrik242/envps/archive/refs/tags/2.0.1.tar.gz"
  sha256 "226f95b2c3d7a1792f1098cabed0188f50c2726a8eedc9e9167383de7c5b666d"
  license "MIT"
  revision 1

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
