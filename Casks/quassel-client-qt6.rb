cask "quassel-client-qt6" do
  version "0.15-pre-qt6.20260615.095224"
  sha256 "35e2b65eec1ec43f7c48a82a8f2bf55cb9a40c0fa8053e7f7ea8fc8718872cb7"

  url "https://github.com/henrik242/quassel-client/releases/download/#{version}/QuasselClient-macOS-arm64-#{version}.dmg",
      verified: "github.com/henrik242/quassel-client/"
  name "Quassel IRC (Qt 6)"
  desc "Quassel IRC: Chat comfortably. Everywhere"
  homepage "https://quassel-irc.org/"

  # The repo also publishes non-Qt 6 builds (see the quassel-client cask), so
  # match only the "-pre-qt6.<timestamp>" release tags here.
  livecheck do
    url :url
    strategy :github_releases do |json|
      json.map { |release| release["tag_name"] }
          .grep(/\A\d[\d.]*-pre-qt6\.[\d.]+\z/)
    end
  end

  # disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on macos: :big_sur
  depends_on arch: :arm64

  # Renamed so it can be installed alongside the non-Qt 6 quassel-client cask.
  app "Quassel Client.app", target: "Quassel Client Qt6.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Quassel Client Qt6.app"]
  end

  zap trash: "~/Library/Preferences/org.quassel-irc.client.plist"

  caveats <<~EOS
    The app is not signed or notarized. The quarantine attribute has been removed
    automatically on install by running:
      xattr -dr com.apple.quarantine "/Applications/Quassel Client Qt6.app"
  EOS
end
