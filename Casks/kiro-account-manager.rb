cask "kiro-account-manager" do
  version "1.9.0"

  on_intel do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
    sha256 "aaece0f14d2c36ebe7c461fa35ddd55b3cc3408b6b260025316b2981bc950997"
  end

  on_arm do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_aarch64.dmg"
    sha256 "f3e8f4a1a8c24af2cb02fa1f4707c45a4d72b5e4ddd1a68059dad6feb8830f63"
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
