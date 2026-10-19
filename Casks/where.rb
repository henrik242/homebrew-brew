cask "where" do
  version "646"
  sha256 "a071cb1838ddae3ca561f684dc9e6c78d5e7406ac6fc00ead51c296c3bc6cb68"

  url "https://github.com/henrik242/where/releases/download/v#{version}/Where-v#{version}.dmg"
  name "Where"
  desc "Offline hiking maps for Norway"
  homepage "https://where.synth.no/about"

  # Releases are shared with the Android and iOS builds, so match only those
  # that carry a desktop DMG.
  livecheck do
    url :url
    strategy :github_releases do |json|
      json.filter_map do |release|
        next if release["assets"].none? { |asset| asset["name"].match?(/\AWhere-v\d+\.dmg\z/) }

        release["tag_name"][/\Av(\d+)\z/, 1]
      end
    end
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Where.app"

  zap trash: "~/.where"
end
