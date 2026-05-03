class Kmpzip < Formula
  desc "Compress and extract ZIP and GZIP archives"
  homepage "https://github.com/henrik242/kmp-zip"
  version "0.11.1"
  license "MPL-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.1/kmpzip-macos-arm64"
      sha256 "1ad8becc44062e690c24e26bcd941af47b4cbe08fc445643283a11c969663656"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.1/kmpzip-macos-x64"
      sha256 "446584e0fa81f134e4e8c84cb5ceac12cf8f4b16ca07c8ccee20ae12de0fb80d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.1/kmpzip-linux-arm64"
      sha256 "f0c576f1e15776814727aab17910c09514ea7679d61d7195c65822a34a51b4fc"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v0.11.1/kmpzip-linux-x64"
      sha256 "22df30a769b37c8155bc97752b5bddd424cfae83bb430f0396579d9a70b04cd7"
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
