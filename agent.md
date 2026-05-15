# Agent workflow

This repository's update actions resolve upstream app releases, refresh the target cask and HTML catalog snapshot, validate the Ruby syntax, push an update branch, and open a pull request automatically.

The workflows run daily via schedule, and can also be triggered manually via `workflow_dispatch`.

Agent workflow (for manual intervention or debugging):

1. Run the GitHub Actions workflow:

   ```sh
   gh workflow run update-github-stars-manager-cask.yml --repo wangre666/homebrew-tap
   gh workflow run update-kiro-account-manager-cask.yml --repo wangre666/homebrew-tap
   ```

2. Check the workflow run result and logs:

   ```sh
   gh run view <run-id> --repo wangre666/homebrew-tap --json status,conclusion,url
   gh run view <run-id> --repo wangre666/homebrew-tap --log
   ```

3. If the workflow succeeded, a pull request will have been created automatically. Review and merge it:

   ```sh
   gh pr list --repo wangre666/homebrew-tap
   gh pr merge <pr-number> --repo wangre666/homebrew-tap --merge
   ```
