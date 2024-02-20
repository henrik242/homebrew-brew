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

  bottle do
    root_url "https://github.com/henrik242/homebrew-brew/releases/download/1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9a060c6377222bc671f93e0e0556b61b484246a8ce2cf9ad51649af509b83801"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "84e53916852ba51134a9662c7961dd3aa19fbd3387d04d279955da3d3760d6f8"
  end

  test do
    assert_equal "Unaccessible or missing PID: 1234567890", shell_output("#{bin}/envps 1234567890").strip
    assert_equal "Illegal PID: FOO", shell_output("#{bin}/envps FOO").strip
  end
end
