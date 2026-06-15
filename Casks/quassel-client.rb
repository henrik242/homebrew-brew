cask "quassel-client" do
  version "0.15-pre.4764"
  sha256 "cc8f3ec5af29cf3c957b63e8bb515db44482e9def533036a4d209dc75d5e5194"

  url "https://github.com/henrik242/quassel-client/releases/download/#{version}/QuasselClient-macOS-arm64-#{version}.dmg",
      verified: "github.com/henrik242/quassel-client/"
  name "Quassel IRC"
  desc "Quassel IRC: Chat comfortably. Everywhere"
  homepage "https://quassel-irc.org/"

  # The repo also publishes Qt 6 builds (see the quassel-client-qt6 cask), so
  # match only the non-qt6 "-pre.N" release tags here.
  livecheck do
    url :url
    strategy :github_releases do |json|
      json.map { |release| release["tag_name"] }
          .grep(/\A\d[\d.]*-pre\.\d+\z/)
    end
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
