cask "havbunn" do
  version "1.2.2"
  sha256 "e02faf6467d5a09994e231e3900bd92fcb3ef67c3c71391d9e39c26954a94426"

  url "https://github.com/henrik242/havbunn/releases/download/v#{version}/Havbunn-#{version}.zip"
  name "Havbunn"
  desc "Screen saver showing a Norwegian fjord seabed"
  homepage "https://github.com/henrik242/havbunn"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Havbunn.app"

  zap trash: [
    "~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/no.havbunn.screensaver.*.plist",
    "~/Library/Containers/no.synth.havbunn.screensaver",
  ]

  caveats <<~EOS
    Havbunn.app carries the screen saver as an app extension. Open the app once
    to register it, then pick Havbunn in System Settings > Wallpaper, under
    Screen Saver.
  EOS
end
