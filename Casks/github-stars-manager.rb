cask "github-stars-manager" do
  version "0.7.7"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "c850a9d91acf7334b188ce2c1cbeaf53312ba2862af2febd631047d8c6c24983"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "db3344c38d62f58bc86b8d0f44fa215ee08778071a644d0a0cf3be5fb9130587"
  end

  name "GitHub Stars Manager"
  desc "AI-powered GitHub Stars organizer with semantic search and release tracking"
  homepage "https://github.com/AmintaCCCP/GithubStarsManager"

  app "GitHub Stars Manager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GitHub Stars Manager.app"]
  end

  zap trash: [
    "~/Library/Application Support/github-stars-manager",
    "~/Library/Preferences/com.githubstarsmanager.plist",
    "~/Library/Logs/github-stars-manager",
  ]
end
