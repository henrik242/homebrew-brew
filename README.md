# henrik242/brew

A personal [Homebrew](https://docs.brew.sh) tap: my own tools, plus formulae and casks
that were disabled or removed from homebrew-core and homebrew-cask, kept here so they
remain installable.

The `henrik242/brew/<name>` install commands below add the tap automatically. To add it
up front instead:

```
brew tap henrik242/brew
```

### CCB (Cocoa CapsBeeper)

Menu bar app that sounds an alarm when Caps Lock is on. See [unsigned apps](#unsigned-apps).

```
brew install --cask henrik242/brew/ccb
```

Source: https://github.com/henrik242/ccb

### envps

Show process environment variables.

```
brew install henrik242/brew/envps
```

Source: https://github.com/henrik242/envps

### kmpzip

Compress and extract ZIP and GZIP archives.

```
brew install henrik242/brew/kmpzip
```

Source: https://github.com/henrik242/kmp-zip

### Quassel IRC client

[Disabled in homebrew-cask](https://github.com/Homebrew/homebrew-cask/blob/5c0e5bee11729f4fe53a8afebcae4a2de472ec08/Casks/q/quassel-client.rb)
because it fails the Gatekeeper check. This is a native Apple Silicon (arm64) build, so no
Rosetta is needed. See [unsigned apps](#unsigned-apps).

```
brew install --cask henrik242/brew/quassel-client
```

The Qt 6 build installs as `Quassel Client Qt6.app`, so both casks can be installed side by side:

```
brew install --cask henrik242/brew/quassel-client-qt6
```

Source: https://github.com/henrik242/quassel-client/releases

### Ruby (deprecated versions)

Older Ruby versions [disabled and removed from Homebrew core](https://github.com/Homebrew/homebrew-core/commit/a503fdcb7d7dafd0f41bf8d9f4f0302cacba22ba):

```
brew install henrik242/brew/ruby@2.4
brew install henrik242/brew/ruby@2.5
brew install henrik242/brew/ruby@2.6
brew install henrik242/brew/ruby@2.7
brew install henrik242/brew/ruby@3.0
brew install henrik242/brew/ruby@3.1
```

Ruby 2.4 through 2.6 pull in `henrik242/brew/openssl@1.1`, which was removed from core as
well. It is a dependency only, and not meant to be installed on its own.

### SQL Workbench/J

DBMS-independent SQL query tool, requires Java 21+.
[Disabled in homebrew-cask](https://github.com/Homebrew/homebrew-cask/blob/a64b5e8b430481379c0057aa9bea611ad0c6bced/Casks/s/sqlworkbenchj.rb)
because it fails the Gatekeeper check. See [unsigned apps](#unsigned-apps).

```
brew install --cask henrik242/brew/sqlworkbenchj
```

Source: https://www.sql-workbench.eu/

### Stardates

Convert between stardates and other calendar systems. I originally uploaded this to
FreshPorts in 2005: https://www.freshports.org/astro/stardates/

```
brew install henrik242/brew/stardates
```

* Source: https://github.com/henrik242/stardates
* Original source: [ftp.cc.umanitoba.ca/startrek/stardates-pgms/](ftp://ftp.cc.umanitoba.ca/startrek/stardates-pgms/)
* More info: https://starchive.cs.umanitoba.ca/?stardates/

### VladBot

IRC bot based on HopBot.

```
brew install henrik242/brew/vladbot
```

Source: https://github.com/hipdrome/vladbot

## Unsigned apps

The apps in the casks above are not signed or notarized, so macOS Gatekeeper would refuse
to open them. Each cask therefore clears the quarantine attribute for you on install:

```
xattr -dr com.apple.quarantine "/Applications/<the app>.app"
```

Run that yourself if you ever move or restore an app copy that is still quarantined.

## Homebrew

`brew help`, `man brew` or [Homebrew's documentation](https://docs.brew.sh).
