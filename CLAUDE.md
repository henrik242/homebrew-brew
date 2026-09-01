## Repo layout

A Homebrew tap: `Formula/*.rb` for CLI tools and libraries, `Casks/*.rb` for `.app` bundles.
`.github/workflows/tests.yml` runs `brew test-bot` on Linux and macOS for every push and PR.

## Workflow

- Verify checksums by downloading the actual asset (`curl -sL <url> | shasum -a 256`). Never
  copy a sha256 from elsewhere or guess it
- Run `brew style Formula/<name>.rb` (or `Casks/<name>.rb`) before committing
- When a release changes the CLI, re-check the formula `test do` block against the new binary.
  Subcommands get renamed
- Changing a formula without a new upstream version: bump `revision`. Bumping `version`: drop
  any existing `revision`
- Changing a cask: bump `version` if the installed artifact changes. Casks have no `revision`,
  so a local-only change uses the `version "2.1,1"` comma suffix, read back as
  `version.csv.first` in the url. Those casks need the `livecheck` override that returns the
  full local version when upstream is unchanged, otherwise livecheck reports "newer than
  upstream". If only metadata changes (caveats, desc), flag it to the user
- When adding a formula or cask, also add it to README.md
- After pushing, users need `brew update` before `brew upgrade` to refresh the tap cache

## Homebrew formula lint rules

- Use the `xcodebuild` helper method, not `system "xcodebuild"`
- Use new Ruby hash syntax: `xcode: ["14.0", :build]` not `:xcode => ["14.0", :build]`
- Use `assert_path_exists` not `assert_predicate path, :exist?`
- Dependency order matters: `xcode` before `macos`

## .app distribution

- Use a Cask, not a Formula, to install `.app` bundles to `/Applications`. Formulae can't
  write there due to permissions
- The apps here are unsigned and unnotarized. Homebrew removed the `--no-quarantine` install
  flag, so each cask strips quarantine itself in `postflight` with
  `xattr -dr com.apple.quarantine "#{appdir}/<app>.app"`, and says so in `caveats`. Don't
  reintroduce `--no-quarantine` in casks or docs
