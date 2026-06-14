cask "ccb" do
  version "2.1,1"
  sha256 "9d867099f3d9cee58fc901f60656f986dce9e25909059056fae1fb10ab9ad817"

  url "https://github.com/henrik242/ccb/releases/download/#{version.csv.first}/CCB.app.tgz"
  name "Cocoa CapsBeeper"
  desc "Menu bar app that sounds an alarm when Caps Lock is on"
  homepage "https://github.com/henrik242/ccb"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      # Keep the local revision suffix (",N") matched while upstream is unchanged,
      # so livecheck reports current instead of "newer than upstream".
      next tag if tag != version.csv.first

      version.to_s
    end
  end

  depends_on :macos

  app "Cocoa CapsBeeper.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cocoa CapsBeeper.app"]
  end

  caveats <<~EOS
    The app is not signed or notarized. The quarantine attribute has been removed
    automatically on install by running:
      xattr -dr com.apple.quarantine "/Applications/Cocoa CapsBeeper.app"
  EOS
end
