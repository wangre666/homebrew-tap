cask "kiro-account-manager" do
  version "1.8.5"

  on_intel do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
    sha256 "f90aa3cc5c9abb61b6ecf76e0d2225f8e9a9e5885d73899dafb3d3a80bb0c820"
  end

  on_arm do
    url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_aarch64.dmg"
    sha256 "fdd1d08d72a813f961915c137d29fd20e75ebabf80f25c38005b34a3cde76521"
  end

  name "Kiro Account Manager"
  desc "Manage Kiro IDE accounts, account switching, and quota monitoring"
  homepage "https://github.com/hj01857655/kiro-account-manager"

  depends_on macos: ">= :catalina"

  app "KiroAccountManager.app"

  caveats <<~EOS
    If macOS reports that the app is damaged, remove the quarantine attribute:

      xattr -dr com.apple.quarantine "/Applications/KiroAccountManager.app"

    This is caused by the upstream app signature/notarization state, not by Homebrew.
  EOS

  zap trash: [
    "~/Library/Application Support/com.kiro.account-manager",
    "~/Library/Application Support/Kiro Account Manager",
    "~/Library/Logs/com.kiro.account-manager",
    "~/Library/Preferences/com.kiro.account-manager.plist",
    "~/Library/Saved Application State/com.kiro.account-manager.savedState",
  ]
end
