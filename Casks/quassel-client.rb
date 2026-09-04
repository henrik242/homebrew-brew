cask "quassel-client" do
  version "0.15-pre.20260629.192154"
  sha256 "7575dbbe265bc8f6e03cef1331d28e9897ce58bcbc7647510d1fbd9fc5c0c083"

  url "https://github.com/henrik242/quassel-client/releases/download/#{version}/QuasselClient-macOS-arm64-#{version}.dmg",
      verified: "github.com/henrik242/quassel-client/"
  name "Quassel IRC"
  desc "Quassel IRC: Chat comfortably. Everywhere"
  homepage "https://quassel-irc.org/"

  # The repo also publishes Qt 6 builds (see the quassel-client-qt6 cask), so
  # match only the non-qt6 "-pre.<timestamp>" release tags here.
  livecheck do
    url :url
    strategy :github_releases do |json|
      json.map { |release| release["tag_name"] }
          .grep(/\A\d[\d.]*-pre\.[\d.]+\z/)
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
