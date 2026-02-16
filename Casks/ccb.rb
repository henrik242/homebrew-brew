cask "ccb" do
  version "2.1"
  sha256 "9d867099f3d9cee58fc901f60656f986dce9e25909059056fae1fb10ab9ad817"

  url "https://github.com/henrik242/ccb/releases/download/#{version}/CCB.app.tgz"
  name "Cocoa CapsBeeper"
  desc "Menu bar app that sounds an alarm when Caps Lock is on"
  homepage "https://github.com/henrik242/ccb"

  app "Cocoa CapsBeeper.app"

  caveats <<~EOS
    The app is not signed or notarized. macOS may show a Gatekeeper warning:
    "Apple could not determine whether the app is free from malware."

    To fix this, run:
      xattr -d com.apple.quarantine "/Applications/Cocoa CapsBeeper.app"

    Or reinstall with:
      brew install --cask --no-quarantine henrik242/brew/ccb
  EOS
end
