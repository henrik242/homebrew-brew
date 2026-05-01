class Kmpzip < Formula
  desc "Compress and extract ZIP and GZIP archives"
  homepage "https://github.com/henrik242/kmp-zip"
  version "0.11.0"
  license "MPL-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.0/kmpzip-macos-arm64"
      sha256 "7dcc83339f94877e0713286d68d914103042a09a600fff60eb695602ab3e00e5"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.0/kmpzip-macos-x64"
      sha256 "1c150801cca494f8aca0f5dca4b0367e1170d14a3595abea55e733caa29dee56"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.0/kmpzip-linux-arm64"
      sha256 "05f7a6976403a2734722f2ff6db898df36d17e46a06fb3c8f56004a794675b37"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.0/kmpzip-linux-x64"
      sha256 "250bb0920014e429d69ad483bfe8facaa42aac9788090b439531167f5e1f0873"
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
