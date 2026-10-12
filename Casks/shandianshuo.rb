cask "shandianshuo" do
  version "0.8.0"

  on_arm do
    url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_arm64.dmg"
    sha256 "cc1ab56878bfe610d588e1bea7e1ce9c34a33d9a4e75f0b962dadc995f4d0343"
  end

  on_intel do
    url "https://github.com/shandianshuo/shandianshuo-releases/releases/download/v#{version}/shandianshuo_#{version}_x64.dmg"
    sha256 "d84de98062ff70ca97ca0aa87298af54268666d479c295d1c4eb471599fe972b"
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
