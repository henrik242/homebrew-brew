cask "quassel-client" do
  version "0.14.0,1"
  sha256 "73b1b65f0e75c88d1dd23aa91c1916a6a3c231472a042eca0907689ab0981b60"

  url "https://github.com/quassel/quassel/releases/download/#{version.csv.first}/QuasselClient-macOS-#{version.csv.first}.dmg",
      verified: "github.com/quassel/quassel/"
  name "Quassel IRC"
  desc "Quassel IRC: Chat comfortably. Everywhere"
  homepage "https://quassel-irc.org/"

  livecheck do
    url :url
    strategy :github_latest do |json|
      tag = json["tag_name"]
      # Keep the local revision suffix (",N") matched while upstream is unchanged,
      # so livecheck reports current instead of "newer than upstream".
      next tag if tag != version.csv.first

      version.to_s
    end
  end

  # disable! date: "2026-09-01", because: :fails_gatekeeper_check

  depends_on :macos

  app "Quassel Client.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Quassel Client.app"]
  end

  zap trash: "~/Library/Preferences/org.quassel-irc.client.plist"

  caveats do
    requires_rosetta
    <<~EOS
      The app is not signed or notarized. The quarantine attribute has been removed
      automatically on install by running:
        xattr -dr com.apple.quarantine "/Applications/Quassel Client.app"
    EOS
  end
end
