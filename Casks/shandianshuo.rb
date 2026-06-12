cask "shandianshuo" do
  version "0.7.0"
  sha256 "f3da5e62b8ac6a619c1da31bf20b6d58566a01a15ceb1b7a4860e402ce631aff"

  url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_universal.dmg"
  name "闪电说"
  desc "AI voice assistant for fast input, replies and editing via voice commands"
  homepage "https://shandianshuo.cn/"

  depends_on macos: ">= :catalina"

  app "闪电说.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/闪电说.app"]
  end

  zap trash: [
    "~/Library/Application Support/shandianshuo",
    "~/Library/Application Support/闪电说",
    "~/Library/Preferences/com.shandianshuo.plist",
    "~/Library/Logs/shandianshuo",
  ]
end
