class Kmpzip < Formula
  desc "Compress and extract ZIP and GZIP archives"
  homepage "https://github.com/henrik242/kmp-zip"
  license "MPL-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.1.0/kmpzip-macos-arm64"
      sha256 "71f7bc1a78007a073d77825ad32138bd2e033f1d725f6904c1d301418fdea84a"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.1.0/kmpzip-macos-x64"
      sha256 "b28eea13ce26addde06d77cb889abd2f30f65ecde3b2ce3ec26411a1206eed5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.1.0/kmpzip-linux-arm64"
      sha256 "c43e96aa428c448e24edb1ec36ff2f67f170b62e688c35360c96b52af013add4"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.1.0/kmpzip-linux-x64"
      sha256 "cfb4e7808083440e8434ecf0dbeaa9afd83c46973a6fa365567cec1678a56ac2"
    end
  end

  def install
    bin.install Dir["kmpzip-*"].first => "kmpzip"
  end

  test do
    (testpath/"hello.txt").write("hello world")
    system bin/"kmpzip", "zip", "out.zip", "hello.txt"
    assert_path_exists testpath/"out.zip"
    assert_match "hello.txt", shell_output("#{bin}/kmpzip list out.zip")

    mkdir "extracted"
    system bin/"kmpzip", "unzip", "out.zip", "-d", "extracted"
    assert_equal "hello world", (testpath/"extracted/hello.txt").read
  end
end
