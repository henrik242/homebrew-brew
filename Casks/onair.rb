cask "onair" do
  version "3.0.1"
  sha256 "6cd077eb3904bf192a355dd20f4f8b6581abce0c3abcbb1013c38e0939b924f5"

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
