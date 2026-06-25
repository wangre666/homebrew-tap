cask "tiez-clipboard" do
  version "0.1.3"

  on_intel do
    url "https://github.com/jimuzhe/tiez-clipboard/releases/download/mac-v#{version}/TieZ_#{version}_x64.dmg"
    sha256 "8b99d930010fe3a98cc1dbdbbdef0e2f74db04a1be038a5796e7238469a2b2a3"
  end

  on_arm do
    url "https://github.com/jimuzhe/tiez-clipboard/releases/download/mac-v#{version}/TieZ_#{version}_aarch64.dmg"
    sha256 "054093aac9da246a3c6782300b70e120f5bd33bc8327df304b0b5ec5f4ab6c6d"
  end

  name "TieZ"
  desc "Cross-platform clipboard manager with history, tags, sync and privacy protection"
  homepage "https://github.com/jimuzhe/tiez-clipboard"

  depends_on macos: ">= :catalina"

  app "TieZ.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TieZ.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.tiez",
    "~/Library/Application Support/TieZ",
    "~/Library/Logs/com.tiez",
    "~/Library/Preferences/com.tiez.plist",
    "~/Library/Saved Application State/com.tiez.savedState",
  ]
end
