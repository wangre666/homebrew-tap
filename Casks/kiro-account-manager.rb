cask "kiro-account-manager" do
  version "1.9.3"

  on_intel do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
    sha256 "28f40374aa17923f9726c28fb16ec63d35898b75a16a477ece70f0fc66f34484"
  end

  on_arm do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_aarch64.dmg"
    sha256 "54b36117352994ce332544b924ca5a13896a718318a46ad2cc1de118c5e4eb0e"
  end

  name "Kiro Account Manager"
  desc "Manage Kiro IDE accounts, account switching, and quota monitoring"
  homepage "https://github.com/hj01857655/kiro-account-manager"

  app "KiroAccountManager.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/KiroAccountManager.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.kiro.account-manager",
    "~/Library/Application Support/Kiro Account Manager",
    "~/Library/Logs/com.kiro.account-manager",
    "~/Library/Preferences/com.kiro.account-manager.plist",
    "~/Library/Saved Application State/com.kiro.account-manager.savedState",
  ]
end
