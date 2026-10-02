cask "onair" do
  version "3.0.3"
  sha256 "0d5ed006e648e7a6fb67c0c8ff5d04d47a7050404b87958b2c14ca1b48f73e1a"

  url "https://github.com/henrik242/OnAir/releases/download/v#{version}/OnAir.app.tgz"
  name "OnAir"
  desc "Menu bar app that turns on a Homey light while a camera is in use"
  homepage "https://github.com/henrik242/OnAir"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "OnAir.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/OnAir.app"]
  end

  zap trash: "~/.onair.ini"

  caveats <<~EOS
    The app is ad-hoc signed and not notarized. The quarantine attribute has been
    removed automatically on install by running:
      xattr -dr com.apple.quarantine "/Applications/OnAir.app"

    OnAir runs in the menu bar with no dock icon. Configure your Homey Pro
    address, token and light from the menu bar.
  EOS
end
