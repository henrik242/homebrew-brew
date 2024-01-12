class Envps < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/envps"
  url "https://github.com/henrik242/envps/archive/refs/tags/1.4.tar.gz"
  sha256 "fa199e06388db5d8dbfba6c7bfc8ada0886f4ae33245b76ea7ed5d0b4a837bef"
  license "MIT"

  def install
    system "make"
    bin.install "envps"
  end

  test do
    assert_equal "Unaccessible or missing PID: 1234567890", shell_output("#{bin}/envps 1234567890").strip
    assert_equal "Illegal PID: FOO", shell_output("#{bin}/envps FOO").strip
  end
end
