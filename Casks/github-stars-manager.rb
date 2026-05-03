cask "github-stars-manager" do
  version "0.5.5"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "8ae2fccc03c044a776d6fa295412425eda172a47c1c3c47d46b25e9881d6fc5f"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "9aa7ed8491aaac6844922bbcdd603af299a3d095acd0f0279a3ead46ba14b2dd"
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
