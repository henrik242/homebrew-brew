cask "quassel-client-qt6" do
  version "0.15-pre-qt6.20260629.192303"
  sha256 "66576718aaa88ea01d249e271ec42d79c97938f99e764745b3b72f46a9c18ca6"

  url "https://github.com/henrik242/quassel-client/releases/download/#{version}/QuasselClient-macOS-arm64-#{version}.dmg"
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

  depends_on macos: :sonoma
  depends_on arch: :arm64

  # Renamed so it can be installed alongside the non-Qt 6 quassel-client cask.
  app "Quassel Client.app", target: "Quassel Client Qt6.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Quassel Client Qt6.app"]
  end

  zap trash: "~/Library/Preferences/org.quassel-irc.client.plist"

  caveats <<~EOS
    The app is not signed or notarized. The quarantine attribute has been removed
    automatically on install by running:
      xattr -dr com.apple.quarantine "/Applications/Quassel Client Qt6.app"
  EOS
end
