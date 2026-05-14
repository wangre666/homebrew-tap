cask "github-stars-manager" do
  version "0.5.8"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "2cff888e328a7fdb180e5e2d4084740cd935ebbe39f9531ad9c706014c8e1408"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "5a5d34d4f73ecb691c81b7de4280fd33e261ce6f3b90f0c1c0f44e7b51ff7080"
  end

  name "GitHub Stars Manager"
  desc "AI-powered GitHub Stars organizer with semantic search and release tracking"
  homepage "https://github.com/AmintaCCCP/GithubStarsManager"

  app "GitHub Stars Manager.app"

  caveats <<~EOS
    If macOS reports that the app is damaged, remove the quarantine attribute:

      xattr -dr com.apple.quarantine "/Applications/GitHub Stars Manager.app"

    This is caused by the upstream app signature/notarization state, not by Homebrew.
  EOS

  zap trash: [
    "~/Library/Application Support/github-stars-manager",
    "~/Library/Preferences/com.githubstarsmanager.plist",
    "~/Library/Logs/github-stars-manager",
  ]
end
