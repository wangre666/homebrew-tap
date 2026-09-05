cask "github-stars-manager" do
  version "0.7.9"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "80a10ffa17cab1c84820d89d7a63f6aa9c1ec7fc40803e990ff1d7fc70204f35"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "a9b4de370cc459dc8f94ba51da104d0ba916caeada2221ea8d56f46fd941692d"
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
