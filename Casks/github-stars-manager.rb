cask "github-stars-manager" do
  version "0.5.7"

  on_intel do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}.dmg"
    sha256 "c28671376e567ab57241f37a00eed41ddb289533af5affca1a0a8c9f945c6cdb"
  end

  on_arm do
    url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}-arm64.dmg"
    sha256 "9490c541639218776db342f7ad8bed6f463a5af063153d020a417b7ee3cdca76"
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
