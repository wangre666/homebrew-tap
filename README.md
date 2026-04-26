# homebrew-tap

## Update casks

Use the `Update GitHub Stars Manager cask` GitHub Actions workflow to refresh
`Casks/github-stars-manager.rb`.

- Leave `version` empty to use the latest upstream GitHub release.
- Set `version` to a specific value, such as `0.5.4`, to update to that release.

The workflow downloads both Intel and Apple Silicon DMG assets, recalculates the
`sha256` values, updates the cask, and opens a pull request.
