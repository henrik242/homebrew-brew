cask "mtp-mount" do
  version "0.2.6"
  sha256 "0249f24dfd96fc87dbfccf0e2e3fb61084973753d9d5cd9942df75a6689281ad"

  url "https://github.com/henrik242/mtp-mount/releases/download/v#{version}/MtpMount-#{version}.dmg"
  name "MtpMount"
  desc "Mount MTP-over-USB devices as volumes via File Provider"
  homepage "https://github.com/henrik242/mtp-mount"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "MtpMount.app"

  # --uninstall removes the Finder locations, the helper, the extension's data
  # and settings, and unregisters the app so System Settings stops listing it.
  uninstall launchctl: "no.synth.mtpmount.helper",
            quit:      "no.synth.mtpmount",
            script:    {
              executable: "#{appdir}/MtpMount.app/Contents/MacOS/MtpMount",
              args:       ["--uninstall"],
            }

  zap trash: [
    "~/Library/Application Scripts/358L7UXVJ4.no.synth.mtpmount",
    "~/Library/Application Scripts/no.synth.mtpmount.fileprovider",
    "~/Library/Application Support/FileProvider/no.synth.mtpmount.fileprovider",
    "~/Library/Containers/no.synth.mtpmount.fileprovider",
    "~/Library/Group Containers/358L7UXVJ4.no.synth.mtpmount",
    "~/Library/LaunchAgents/no.synth.mtpmount.helper.plist",
    "~/Library/Preferences/no.synth.mtpmount.plist",
  ]

  caveats <<~EOS
    Open MtpMount once from /Applications, then connect a device over USB and
    pick "File transfer". MtpMount then asks you to allow it in Finder: turn on
    File Provider for MtpMount in System Settings > General >
    Login Items & Extensions.
  EOS
end
