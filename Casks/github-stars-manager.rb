cask "github-stars-manager" do
  version "0.8.2"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "74d3e3b1df0527452c8a4174d050e5873c3cc7ea728a30fe381684b8268ec43c"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "ec6048279f9e34cfd3b49d95fef566cc33c7a59583888e7d6e4e33831ac309bf"
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
