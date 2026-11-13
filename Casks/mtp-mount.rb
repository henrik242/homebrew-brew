cask "mtp-mount" do
  version "0.2.1"
  sha256 "92c0833ae7583524a69c0b7c234089c58fd56e72d749e0a645559fc0bc3adead"

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

  uninstall quit: "no.synth.mtpmount"

  zap trash: [
    "~/Library/Containers/no.synth.mtpmount.fileprovider",
    "~/Library/LaunchAgents/no.synth.mtpmount.helper.plist",
  ]

  caveats <<~EOS
    Open MtpMount once from /Applications to install its helper, then enable the
    extension in System Settings > General > Login Items & Extensions >
    File Providers > MtpMount. Connect a device over USB and pick "File transfer".

    To uninstall cleanly, first run MtpMount's Troubleshooting > Uninstall… to
    remove the helper LaunchAgent before removing the cask.
  EOS
end
