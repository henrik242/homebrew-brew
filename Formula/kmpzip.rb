class Kmpzip < Formula
  desc "Compress and extract ZIP and GZIP archives"
  homepage "https://github.com/henrik242/kmp-zip"
  version "0.15.0"
  license "MPL-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.15.0/kmpzip-macos-arm64"
      sha256 "29d9e731de325575e18488a69275eb3f7d74003d4276b39d90f3c3fc2af153ed"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.15.0/kmpzip-macos-x64"
      sha256 "27ed3834c64416a4614ecb588e06bd544d4697600fdc4c29861741c453dba63f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.15.0/kmpzip-linux-arm64"
      sha256 "6f661b2562678ac5658b6afc5b4fef58bd641d65c7ec8d947630e398012610ba"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.15.0/kmpzip-linux-x64"
      sha256 "4d7112d28f9b24947232714baf2ef2cb592d53434c95181bcee3a16c7dffe1cf"
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
