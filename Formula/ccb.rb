class Ccb < Formula
  desc "Menu bar app that sounds an alarm when Caps Lock is on"
  homepage "https://github.com/henrik242/ccb"
  url "https://github.com/henrik242/ccb/archive/refs/tags/2.0.tar.gz"
  sha256 "3775ececa06e516e8253c09efd305ebb0c280fc1e22aa570775b76b06f79a0ab"
  license "Unlicense"
  revision 2

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    xcodebuild "-project", "Cocoa CapsBeeper.xcodeproj",
               "-configuration", "Default",
               "SYMROOT=build"
    prefix.install "build/Default/Cocoa CapsBeeper.app"
  end

  def post_install
    system "rm", "-f", "/Applications/Cocoa CapsBeeper.app"
    system "ln", "-sf", "#{prefix}/Cocoa CapsBeeper.app", "/Applications/Cocoa CapsBeeper.app"
  end

  test do
    assert_path_exists prefix/"Cocoa CapsBeeper.app/Contents/MacOS/Cocoa CapsBeeper"
  end
end
