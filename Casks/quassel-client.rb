cask "quassel-client" do
  version "0.15-pre.4766"
  sha256 "dd507c759d84be199ade0322835df030460954d6635bf68b8d1407c7b2600ba0"

  url "https://github.com/henrik242/quassel/releases/download/#{version}/QuasselClient-macOS-arm64-#{version}.dmg",
      verified: "github.com/henrik242/quassel/"
  name "Quassel IRC"
  desc "Quassel IRC: Chat comfortably. Everywhere"
  homepage "https://quassel-irc.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Quassel Client.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Quassel Client.app"]
  end

  zap trash: "~/Library/Preferences/org.quassel-irc.client.plist"

  caveats <<~EOS
    The app is not signed or notarized. The quarantine attribute has been removed
    automatically on install by running:
      xattr -dr com.apple.quarantine "/Applications/Quassel Client.app"
  EOS
end
