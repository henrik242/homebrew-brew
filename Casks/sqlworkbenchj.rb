cask "sqlworkbenchj" do
  version "133,1"
  sha256 "e445598800435baa0a206a40aba62d83031bb2130420abbc935f6ddc5d638354"

  url "https://www.sql-workbench.eu/Workbench-Build#{version.csv.first}-Mac-with-optional-libs.tgz"
  name "SQL Workbench/J"
  desc "DBMS-independent SQL query tool"
  homepage "https://www.sql-workbench.eu/"

  livecheck do
    url "https://www.sql-workbench.eu/workbench_pad.xml"
    strategy :xml do |xml|
      upstream = xml.elements["//Program_Version"]&.text&.strip
      # Keep the local revision suffix (",N") matched while upstream is unchanged,
      # so livecheck reports current instead of "newer than upstream".
      next upstream if upstream != version.csv.first

      version.to_s
    end
  end

  depends_on :macos

  app "SQLWorkbenchJ.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/SQLWorkbenchJ.app"]
  end

  caveats do
    depends_on_java "21+"
    <<~EOS
      The app is not signed or notarized. The quarantine attribute has been removed
      automatically on install by running:
        xattr -dr com.apple.quarantine "/Applications/SQLWorkbenchJ.app"
    EOS
  end
end
