class Kmpzip < Formula
  desc "Compress and extract ZIP and GZIP archives"
  homepage "https://github.com/henrik242/kmp-zip"
  version "0.12.0"
  license "MPL-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.0/kmpzip-macos-arm64"
      sha256 "fb1afb1fe798eaac59e74ecffbfc2dc37d8d8b347c0c6d6b8864b6d245819baf"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.0/kmpzip-macos-x64"
      sha256 "69367b01a02dbd7f55fc4d7be5aeada6bf7070d47d8ca9dd581b9d326b3247f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.0/kmpzip-linux-arm64"
      sha256 "a44d4426127a3f3f5d6f1b695b1eb7183bb61c5114df7f5e63897ccee2465586"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.0/kmpzip-linux-x64"
      sha256 "139810bef8c01bb2e3b24ab526a7fa3a46813de90a29492ca4479dfb2c4abdd6"
    end
  end

  def install
    bin.install Dir["kmpzip-*"].first => "kmpzip"
  end

  test do
    (testpath/"hello.txt").write("hello world")
    system bin/"kmpzip", "create", "out.zip", "hello.txt"
    assert_path_exists testpath/"out.zip"
    assert_match "hello.txt", shell_output("#{bin}/kmpzip list out.zip")

    mkdir "extracted"
    system bin/"kmpzip", "extract", "out.zip", "-d", "extracted"
    assert_equal "hello world", (testpath/"extracted/hello.txt").read
  end
end
