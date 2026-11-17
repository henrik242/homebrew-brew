cask "mtp-mount" do
  version "0.2.8"
  sha256 "e2edc609532bfd503ee1d1d4161094c48e543e8a49484bf163f310e8a711e03d"

  url "https://github.com/henrik242/mtp-mount/releases/download/v#{version}/MtpMount-#{version}.dmg"
  name "MtpMount"
  desc "Mount MTP-over-USB devices as volumes via File Provider"
  homepage "https://github.com/henrik242/mtp-mount"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "MtpMount.app"

  # Upgrades run this too, so it only stops the app and its helper; the app
  # reinstalls the helper on its next launch. A user-domain bootout instead of
  # `launchctl:`, which also probes the system domain with sudo.
  uninstall quit:   "no.synth.mtpmount",
            script: {
              executable:   "/bin/launchctl",
              args:         ["bootout", "gui/#{Process.uid}/no.synth.mtpmount.helper"],
              must_succeed: false,
            },
            trash:  "~/Library/LaunchAgents/no.synth.mtpmount.helper.plist"

  # --uninstall removes the Finder locations, the helper, the extension's data
  # and settings, and unregisters the app so System Settings stops listing it.
  zap script: {
        executable: "#{appdir}/MtpMount.app/Contents/MacOS/MtpMount",
        args:       ["--uninstall"],
      },
      trash:  [
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
    pick "File transfer". MtpMount then asks you to allow it in Finder:
    - macOS 15 and later: turn on File Provider for MtpMount in
      System Settings > General > Login Items & Extensions.
    - macOS 14: click Enable at the top of the Finder window it opens.
  EOS
end
