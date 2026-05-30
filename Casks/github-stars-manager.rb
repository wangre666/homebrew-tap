cask "github-stars-manager" do
  version "0.5.9"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "235a358061b9e64bf4a8eb900c32f040981f19cc2c3d3c9dc46b6bc0340aae33"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "bae050c30256958384c06c7f33f024b35ab37c2eda8016cd3c21cc3f8c0ded98"
  end

  name "GitHub Stars Manager"
  desc "AI-powered GitHub Stars organizer with semantic search and release tracking"
  homepage "https://github.com/AmintaCCCP/GithubStarsManager"

  app "GitHub Stars Manager.app"

  caveats <<~EOS
    如果更新后软件不可用，或 macOS 提示应用已损坏/无法打开，请运行：

      xattr -dr com.apple.quarantine "/Applications/GitHub Stars Manager.app"
  EOS

  zap trash: [
    "~/Library/Application Support/github-stars-manager",
    "~/Library/Preferences/com.githubstarsmanager.plist",
    "~/Library/Logs/github-stars-manager",
  ]
end
