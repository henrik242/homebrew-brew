## Workflow

- When changing a formula, always bump `revision` so `brew upgrade` picks up the change
- When adding a new formula, also add it to README.md
- After pushing formula changes, users need `brew update` before `brew upgrade` to refresh the tap cache

## Homebrew formula lint rules

- Use `xcodebuild` helper method, not `system "xcodebuild"`
- Use new Ruby hash syntax: `xcode: ["14.0", :build]` not `:xcode => ["14.0", :build]`
- Use `assert_path_exists` not `assert_predicate path, :exist?`
- Dependency order matters: `xcode` before `macos`

## .app formulae

- Use `post_install` (not `install`) for symlinks to `/Applications`
- Use `system "ln", "-sf"` instead of Ruby's `ln_sf` — avoids permission issues with paths outside the Homebrew prefix
- Remove stale target before creating symlink: `system "rm", "-f"` first
