class Kmpzip < Formula
  desc "Compress and extract ZIP and GZIP archives"
  homepage "https://github.com/henrik242/kmp-zip"
  version "0.12.1"
  license "MPL-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.1/kmpzip-macos-arm64"
      sha256 "69bf998fd30286d91d4b055288edd29aba8e722a40db6c2ce6215b906ad8bdd2"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.1/kmpzip-macos-x64"
      sha256 "3aeca8faffdb3c62f8058f0c1cf4ff5d2ea0df680351748499cfe27378542042"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.1/kmpzip-linux-arm64"
      sha256 "76c08eca84bfd76d5045c17282ecd9f5abe0f4ca3f54d93dbba807c53846c7fc"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.12.1/kmpzip-linux-x64"
      sha256 "316c7e6a97657528790c680ba84812d9073ea2980b3e856fb43105d81b5e361b"
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
