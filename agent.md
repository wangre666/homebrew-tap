# Agent workflow

This repository's update action only resolves the upstream GitHub Stars Manager release, refreshes the cask, validates the Ruby syntax, and pushes an update branch.

Agent workflow:

1. Run the GitHub Actions workflow:

   ```sh
   gh workflow run update-github-stars-manager-cask.yml --repo wangre666/homebrew-tap
   ```

2. Check the workflow run result and logs:

   ```sh
   gh run view <run-id> --repo wangre666/homebrew-tap --json status,conclusion,url
   gh run view <run-id> --repo wangre666/homebrew-tap --log
   ```

3. Sync the pushed update branch to the local repository:

   ```sh
   git fetch origin update/github-stars-manager-v<version>:refs/remotes/origin/update/github-stars-manager-v<version>
   ```

4. Verify the update locally before opening a PR:

   ```sh
   git diff main..origin/update/github-stars-manager-v<version> -- Casks/github-stars-manager.rb
   git show origin/update/github-stars-manager-v<version>:Casks/github-stars-manager.rb | ruby -c
   brew audit --cask github-stars-manager
   ```

5. Create or update the pull request from the local machine with an authenticated GitHub CLI:

   ```sh
   gh pr create \
     --repo wangre666/homebrew-tap \
     --base main \
     --head update/github-stars-manager-v<version> \
     --title "Update github-stars-manager cask to v<version>" \
     --body "Updates the GitHub Stars Manager cask to v<version> and refreshes both Intel and Apple Silicon sha256 values."
   ```

Do not create pull requests from inside the GitHub Actions workflow. The repository can disallow pull request creation by `GITHUB_TOKEN`, which causes the update run to fail after the branch has already been pushed.
