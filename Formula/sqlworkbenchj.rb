class Sqlworkbenchj < Formula
  desc "DBMS-independent SQL query tool"
  homepage "https://www.sql-workbench.eu/"
  url "https://www.sql-workbench.eu/Workbench-Build131.zip"
  sha256 "b63e897988839cbd87114a50735c7f9b847941bdf5b5502ff212c1e1a12dc755"
  license "Proprietary"

  livecheck do
    url "https://www.sql-workbench.eu/downloads.html"
    regex(/Workbench[._-]Build(\d+)\.zip/i)
  end

  resource "icon" do
    url "https://www.sql-workbench.eu/Workbench.icns"
    sha256 "ccbb197d6a9ad92ea8755e156a13d38d07d1e26b5bb6739305d0a39552916860"
  end

  def install
    app_path = prefix/"SQLWorkbenchJ.app"

    # Create the necessary directories for the app bundle
    (app_path/"Contents/Java").mkpath
    (app_path/"Contents/MacOS").mkpath
    (app_path/"Contents/Resources").mkpath

    # Unpack the ZIP file contents into Contents/Java
    system "unzip", "-qq", cached_download, "-d", app_path/"Contents/Java"

    # Install the icon file into Contents/Resources
    resource("icon").stage do
      (app_path/"Contents/Resources").install "Workbench.icns"
    end

    # Create the Info.plist file in Contents/
    (app_path/"Contents/Info.plist").write <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
         "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>CFBundleName</key>
          <string>SQLWorkbenchJ</string>
          <key>CFBundleDisplayName</key>
          <string>SQL Workbench/J</string>
          <key>CFBundleIdentifier</key>
          <string>sqlworkbench.app</string>
          <key>CFBundleVersion</key>
          <string>#{version}</string>
          <key>CFBundleExecutable</key>
          <string>SqlWorkbenchJLauncher</string>
          <key>CFBundlePackageType</key>
          <string>APPL</string>
          <key>CFBundleIconFile</key>
          <string>Workbench.icns</string>
          <key>LSMinimumSystemVersion</key>
          <string>10.10.0</string>
          <key>NSHumanReadableCopyright</key>
          <string>Thomas Kellerer 2002-2024</string>
          <key>LSApplicationCategoryType</key>
          <string>public.app-category.developer-tools</string>
      </dict>
      </plist>
    EOS

    # Create the launcher script in Contents/MacOS/
    (app_path/"Contents/MacOS/SqlWorkbenchJLauncher").write <<~EOS
      #!/bin/bash
      cd "$(dirname "$0")"/../Java
      exec "#{Formula["openjdk@11"].opt_bin}/java" \\
        -Dapple.laf.useScreenMenuBar=true \\
        -Dapple.awt.showGrowBox=true \\
        -Xmx2048m \\
        -Xdock:name="SQL Workbench/J" \\
        -jar sqlworkbench.jar
    EOS
    chmod "+x", app_path/"Contents/MacOS/SqlWorkbenchJLauncher"
  end

  def caveats
    <<~EOS
      SQLWorkbenchJ.app has been installed to:
        #{opt_prefix}

      To use it, you may need to right-click on "SQLWorkbenchJ.app" and select "Open" due to macOS security restrictions.

      SQL Workbench/J requires Java 11 or later. You can install it with:
        brew install openjdk@11
    EOS
  end

  test do
    assert_predicate prefix/"SQLWorkbenchJ.app", :exist?, "SQLWorkbenchJ.app was not installed"
  end
end
