cask "shandianshuo" do
  version "0.7.6"
  sha256 "30399c8b5b6df1d0f36ca286722bb4b32241d4625bdcfbfee34e1c24cfb06e7b"

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
