cask "havbunn" do
  version "1.2.1"
  sha256 "966637cf92fcaf08a9d74f2aa97ae025d9355525d43efc9f192b0c5d3e34264f"

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
