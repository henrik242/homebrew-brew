# Various Homebrew formulae

### CCB (Cocoa CapsBeeper)

```
brew install --cask --no-quarantine henrik242/brew/ccb
```

The app is not notarized, so macOS Gatekeeper will warn that it can't check for malware.
The `--no-quarantine` flag prevents this. If you already installed without it, run:
```
xattr -d com.apple.quarantine "/Applications/Cocoa CapsBeeper.app"
```

Source: https://github.com/henrik242/ccb

### envps

```
brew install henrik242/brew/envps
```

Source: https://github.com/henrik242/envps

### kmpzip

```
brew install henrik242/brew/kmpzip
```

Source: https://github.com/henrik242/kmp-zip

### Ruby (deprecated versions)

Older Ruby versions [disabled and removed from Homebrew core](https://github.com/Homebrew/homebrew-core/commit/a503fdcb7d7dafd0f41bf8d9f4f0302cacba22ba), copied here so they remain installable:

```
brew install henrik242/brew/ruby@2.4
brew install henrik242/brew/ruby@2.5
brew install henrik242/brew/ruby@2.6
brew install henrik242/brew/ruby@2.7
brew install henrik242/brew/ruby@3.0
brew install henrik242/brew/ruby@3.1
```

### Stardates

```
brew install henrik242/brew/stardates
```

I originally uploaded this to FreshPorts in 2005: https://www.freshports.org/astro/stardates/

* Source: https://github.com/henrik242/stardates
* Original source: [ftp.cc.umanitoba.ca/startrek/stardates-pgms/](ftp://ftp.cc.umanitoba.ca/startrek/stardates-pgms/)
* More info: https://starchive.cs.umanitoba.ca/?stardates/


### VladBot

```
brew install henrik242/brew/vladbot
```

Source: https://github.com/hipdrome/vladbot

## Homebrew

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
