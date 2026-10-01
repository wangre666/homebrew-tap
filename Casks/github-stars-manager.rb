cask "github-stars-manager" do
  version "0.8.4"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "523056738c3eee8753b9938c770587aa115535c9a6b061bfde17224b97d0b229"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "172fce70a1e5430f0127304824ff7e7414ace81a5ca0ddae494183526d13b693"
  end

  name "GitHub Stars Manager"
  desc "AI-powered GitHub Stars organizer with semantic search and release tracking"
  homepage "https://github.com/AmintaCCCP/GithubStarsManager"

  app "GitHub Stars Manager.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/GitHub Stars Manager.app"]
  end

  zap trash: [
    "~/Library/Application Support/github-stars-manager",
    "~/Library/Preferences/com.githubstarsmanager.plist",
    "~/Library/Logs/github-stars-manager",
  ]
end
