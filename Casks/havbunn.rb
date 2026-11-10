cask "havbunn" do
  version "1.0.1"
  sha256 "6d863bfa4bb6bbb2db4a4edbcb8d2946564e2796f4e22a5d380fbb81c43c4a5c"

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

  screen_saver "Havbunn.saver"

  zap trash: "~/Library/Containers/com.apple.ScreenSaver.Engine.legacyScreenSaver/Data/Library/Preferences/ByHost/no.havbunn.screensaver.*.plist"
end
