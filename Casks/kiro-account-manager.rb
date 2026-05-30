cask "kiro-account-manager" do
  version "1.8.7"

  on_intel do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
    sha256 "7a2f47417027829cbe88820638f9f2c30a86f9a4c61db6c0f81b50f39b70e44e"
  end

  on_arm do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_aarch64.dmg"
    sha256 "25d19368875e39ed08654df04b2ced82140740c0b049f5c6fef0b6414686ce4d"
  end

  name "Kiro Account Manager"
  desc "Manage Kiro IDE accounts, account switching, and quota monitoring"
  homepage "https://github.com/hj01857655/kiro-account-manager"

  depends_on macos: ">= :catalina"

  app "KiroAccountManager.app"

  caveats <<~EOS
    如果更新后软件不可用，或 macOS 提示应用已损坏/无法打开，请运行：

      xattr -dr com.apple.quarantine "/Applications/KiroAccountManager.app"
  EOS

  zap trash: [
    "~/Library/Application Support/com.kiro.account-manager",
    "~/Library/Application Support/Kiro Account Manager",
    "~/Library/Logs/com.kiro.account-manager",
    "~/Library/Preferences/com.kiro.account-manager.plist",
    "~/Library/Saved Application State/com.kiro.account-manager.savedState",
  ]
end
