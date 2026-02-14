## Workflow

- When changing a formula, always bump `revision` so `brew upgrade` picks up the change
- When changing a cask, bump `version` if the installed artifact changes. Casks don't have `revision` — if only metadata (caveats, desc) changes, flag this to the user
- When adding a new formula or cask, also add it to README.md
- After pushing changes, users need `brew update` before `brew upgrade` to refresh the tap cache

## Homebrew formula lint rules

- Use `xcodebuild` helper method, not `system "xcodebuild"`
- Use new Ruby hash syntax: `xcode: ["14.0", :build]` not `:xcode => ["14.0", :build]`
- Use `assert_path_exists` not `assert_predicate path, :exist?`
- Dependency order matters: `xcode` before `macos`

## .app distribution

- Use a Cask (not a Formula) to install .app bundles to `/Applications` — Formulae can't write there due to permissions
- The app is not notarized: document `--no-quarantine` flag and `xattr -d com.apple.quarantine` workaround
