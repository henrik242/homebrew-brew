## Homebrew formula lint rules

- Use `xcodebuild` helper method, not `system "xcodebuild"`
- Use new Ruby hash syntax: `xcode: ["14.0", :build]` not `:xcode => ["14.0", :build]`
- Use `assert_path_exists` not `assert_predicate path, :exist?`
- Dependency order matters: `xcode` before `macos`
- Use `revision N` to force upgrades when the formula changes but upstream version hasn't
- Use `post_install` (not `install`) for symlinks to `/Applications` — it runs outside the build sandbox
