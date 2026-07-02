cask "kiro-account-manager" do
  version "1.9.2"

  on_intel do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
    sha256 "f9dc155d2ebd7bed406d19b5b41641b52c1eda09d85e643bb0248f3d492e2a4b"
  end

  on_arm do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_aarch64.dmg"
    sha256 "3be60477c81da229bcb4e841b6f2e3f4e5b57be531baf8e57c66cf04d9d38286"
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
