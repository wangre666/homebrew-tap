cask "kiro-account-manager" do
  version "1.9.1"

  on_intel do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
    sha256 "b3924f8a29a89db58ce717b0ec967165d4d86eb603cb1598fdace20448c81bc1"
  end

  on_arm do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_aarch64.dmg"
    sha256 "2440280ee0beca3c97adef0e131caa6466b138397c76a62595506cb14144681b"
  end

  name "Kiro Account Manager"
  desc "Manage Kiro IDE accounts, account switching, and quota monitoring"
  homepage "https://github.com/hj01857655/kiro-account-manager"

  depends_on macos: ">= :catalina"

  app "KiroAccountManager.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/KiroAccountManager.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.kiro.account-manager",
    "~/Library/Application Support/Kiro Account Manager",
    "~/Library/Logs/com.kiro.account-manager",
    "~/Library/Preferences/com.kiro.account-manager.plist",
    "~/Library/Saved Application State/com.kiro.account-manager.savedState",
  ]
end
