# homebrew-tap

## GitHub Pages

This repository includes a static catalog page at `index.html`. To publish it
with GitHub Pages, set the Pages source to the `main` branch and the repository
root.

The page shows the current casks, versions, install commands, upstream links,
and architecture-specific `sha256` values. It includes a built-in snapshot and
will also try to refresh the catalog from `Casks/*.rb` through the GitHub API
when served from GitHub Pages.

## Update casks

Use the `Update GitHub Stars Manager cask` GitHub Actions workflow to refresh
`Casks/github-stars-manager.rb`.

- Leave `version` empty to use the latest upstream GitHub release.
- Set `version` to a specific value, such as `0.5.4`, to update to that release.

The workflow downloads both Intel and Apple Silicon DMG assets, recalculates the
`sha256` values, updates the cask, and opens a pull request.
