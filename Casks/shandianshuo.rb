cask "shandianshuo" do
  version "0.8.2"

  on_arm do
    url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_arm64.dmg"
    sha256 "0084ee59ce1fa0fc2a7a21da5254e6a215e939f0d7095224495be6537341cee7"
  end

  on_intel do
    url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_x64.dmg"
    sha256 "a1d79f5879ba3afb692a3d9f29768aaf50c975d77a956191547aeadf945fac01"
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
