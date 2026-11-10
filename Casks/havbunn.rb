cask "havbunn" do
  version "1.0.0"
  sha256 "577496c205413c90f46b565cc44d20a65963aff0fe6183acb9f0d7ddc343fa11"

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
