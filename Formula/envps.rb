class Envps < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/envps"
  url "https://github.com/henrik242/envps/archive/refs/tags/2.0.0.tar.gz"
  sha256 "8bdf21e9234a8b188ab7b7a57ce8ba74be374096860a5c418a72fa3ef9290f36"
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
