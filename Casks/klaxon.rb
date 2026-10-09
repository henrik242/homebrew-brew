cask "klaxon" do
  version "1.0.1-fork.2"
  sha256 "3e5636d004687d8c4ab4d3ee337828126eea09923dde6523a836672856f4d4b6"

  url "https://github.com/henrik242/klaxon/releases/download/fork-v#{version}/Klaxon-#{version}.dmg"
  name "Klaxon"
  desc "Menu bar app that sounds an alarm before calendar events"
  homepage "https://github.com/henrik242/klaxon"

  # The fork branch builds are prereleases tagged "fork-v<version>", which
  # :github_latest skips.
  livecheck do
    url :url
    strategy :github_releases do |json|
      json.map { |release| release["tag_name"] }
          .grep(/\Afork-v\d[\d.]*-fork\.\d+\z/)
          .map { |tag| tag.delete_prefix("fork-v") }
    end
  end

  depends_on macos: :sequoia

  app "Klaxon.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Klaxon.app"]
  end

  zap trash: [
    "~/Library/Application Scripts/nyc.welles.Klaxon",
    "~/Library/Containers/nyc.welles.Klaxon",
    "~/Library/Preferences/nyc.welles.Klaxon.plist",
  ]

  caveats <<~EOS
    The app is signed with a self-signed certificate and is not notarized. The
    quarantine attribute has been removed automatically on install by running:
      xattr -dr com.apple.quarantine "/Applications/Klaxon.app"

    Klaxon runs in the menu bar with no dock icon, and asks for calendar access
    on first launch.
  EOS
end
