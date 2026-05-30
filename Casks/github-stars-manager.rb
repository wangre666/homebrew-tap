cask "github-stars-manager" do
  version "0.6.1"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "6cd6349e39d52806152a1df5508fa3e4f31c3939ac5a360db2cb789b30d3cade"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "a628b8334e9f42db3056eab44067a3705ba3f82cb35232a4cc1c3d842ce5bc05"
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
