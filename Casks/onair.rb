cask "onair" do
  version "3.0.4"
  sha256 "f4a7a1bb4c92421ee4d8d6da91f10ae9d0446f44e92e2bcd9faa696495d49e27"

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
