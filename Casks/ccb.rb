cask "ccb" do
  version "2.1"
  sha256 "845ade0feea37078da79af3e2c5a07f9b1944fdd8a9dd0cbe4a9ceacbd44352f"

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
