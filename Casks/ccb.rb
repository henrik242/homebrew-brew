cask "ccb" do
  version "2.0"
  sha256 "013991b1eb3bdfdea5b5951e99db42f2be1e29d4a478a3c77d4cdbdb60f40fbd"

  url "https://github.com/henrik242/ccb/releases/download/#{version}/CCB.app.tgz"
  name "Cocoa CapsBeeper"
  desc "Menu bar app that sounds an alarm when Caps Lock is on"
  homepage "https://github.com/henrik242/ccb"

  app "Cocoa CapsBeeper.app"
end
