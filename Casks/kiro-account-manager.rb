cask "kiro-account-manager" do
  version "1.8.6"

  url "https://github.com/hj01857655/kiro-account-manager/releases/download/v#{version}/KiroAccountManager_#{version}_x64.dmg"
  sha256 "446c0043be7d85d9557d10989a5784dbedf4c1d4132354809857c39ec4e240d9"

  name "Kiro Account Manager"
  desc "Manage Kiro IDE accounts, account switching, and quota monitoring"
  homepage "https://github.com/hj01857655/kiro-account-manager"

  depends_on macos: ">= :catalina"
  depends_on arch: :x86_64

  app "KiroAccountManager.app"

  caveats <<~EOS
    Upstream currently publishes only a macOS x64 build for this release.

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
