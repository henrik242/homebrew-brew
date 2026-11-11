cask "havbunn" do
  version "1.1.1"
  sha256 "9691e63735bf76fe1fe538a9655e1e223d5e428086194fbd60b21e5a1f248888"

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
