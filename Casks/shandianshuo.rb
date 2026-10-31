cask "shandianshuo" do
  version "0.8.1"

  on_arm do
    url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_arm64.dmg"
    sha256 "1e401338973645365b2a15bbd938a946722e703cec8cb50ee7eeb240912b5cf4"
  end

  on_intel do
    url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_x64.dmg"
    sha256 "5f58f5182bfeb1892809b96f91362474896cdfbb37b445ce03da4c11e5ba25c0"
  end

  name "闪电说"
  desc "AI voice assistant for fast input, replies and editing via voice commands"
  homepage "https://shandianshuo.cn/"

  app "闪电说.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/闪电说.app"]
  end

  zap trash: [
    "~/Library/Application Support/shandianshuo",
    "~/Library/Application Support/闪电说",
    "~/Library/Preferences/com.shandianshuo.plist",
    "~/Library/Logs/shandianshuo",
  ]
end
