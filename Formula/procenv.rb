class Procenv < Formula
  desc "Show process environment variables"
  homepage "https://github.com/henrik242/procenv"
  url "https://github.com/henrik242/procenv/archive/refs/tags/1.3.tar.gz"
  sha256 "34a0be871d5a18a0ccce9747b3c62da37d8b771f74df4feab7bc40fe933b91d9"
  license "MIT"

  def install
    system "make"
    bin.install "procenv"
  end

  test do
    assert_equal "Unaccessible or missing PID: 1234567890", shell_output("#{bin}/procenv 1234567890").strip
    assert_equal "Illegal PID: FOO", shell_output("#{bin}/procenv FOO").strip
  end
end
