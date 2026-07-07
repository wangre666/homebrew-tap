cask "github-stars-manager" do
  version "0.6.8"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "b4c50ef534153e2bbef1f13080c8211e351f98bdd5456f2a5383f5c0f02bbdf7"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "4e6513e72e56a2ef53d52f4575b597b2743c993bd1283072620627ee653a32a2"
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
