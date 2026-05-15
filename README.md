# homebrew-tap

## About

This repository is a Homebrew tap for macOS apps maintained by wangre666. It
currently publishes casks for GitHub Stars Manager and Kiro Account Manager, and
provides a GitHub Pages catalog with versions, install commands, upstream links,
and architecture checksums.

## GitHub Pages

This repository includes a static catalog page at `index.html`. To publish it
with GitHub Pages, set the Pages source to the `main` branch and the repository
root.

The page shows the current casks, versions, install commands, upstream links,
and architecture-specific `sha256` values. It includes a built-in snapshot and
will also try to refresh the catalog from `Casks/*.rb` through the GitHub API
when served from GitHub Pages.

## Update casks

Use the app-specific GitHub Actions workflows to refresh casks and the
`index.html` catalog snapshot.

- Leave `version` empty to use the latest upstream GitHub release.
- Set `version` to a specific value, such as `0.5.4`, to update to that release.

- `Update GitHub Stars Manager cask` refreshes
  `Casks/github-stars-manager.rb`.
- `Update Kiro Account Manager cask` refreshes
  `Casks/kiro-account-manager.rb`.

Each workflow downloads the expected upstream DMG asset or assets, recalculates
the `sha256` values, updates the cask and catalog page, and opens a pull
request.
