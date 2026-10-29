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
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.0.0/kmpzip-macos-arm64"
      sha256 "d7d119fe4fde8cf5c8692b80d1472916413c7991b0c8ee556d868a6f8496defa"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.0.0/kmpzip-macos-x64"
      sha256 "152c2e5d49480c984129793b4a669f0ed95b3253b1cb5df6938ca4721d2ffcfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.0.0/kmpzip-linux-arm64"
      sha256 "088bee9a86e8ec1367fbc9df5c17ae6436633af8805f9ea3784b0078e0246661"
    end
    on_intel do
      url "https://github.com/henrik242/kmp-zip/releases/download/v2.0.0/kmpzip-linux-x64"
      sha256 "bab711068289363622bbd643355bba955c30e1db41a14ee13bdbb53b01e2a9ed"
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
