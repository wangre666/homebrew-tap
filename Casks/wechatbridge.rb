cask "wechatbridge" do
  version "0.1.15"
  sha256 "bc71db15d897bf58c9ee1c1c8a82db5b15591a81164aa0a93bd2b26728d10caa"

  url "https://github.com/wangre666/homebrew-tap/releases/download/wechatbridge-v#{version}-b23/WeChatBridge-#{version}-b23-universal.dmg"
  name "微信流"
  name "WeChatBridge"
  desc "Forward WeChat chat history to AI agents and Obsidian"
  homepage "https://github.com/freestylefly/WeChatBridge"

  depends_on macos: :sonoma

  app "微信流.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/微信流.app"]
  end

  zap trash: [
    "~/Library/Application Support/WeChatBridge",
    "~/Library/Application Support/com.xiangming.wechatbridge",
    "~/Library/Caches/com.xiangming.wechatbridge",
    "~/Library/Group Containers/DLKMC3ZRZQ.com.xiangming.wechatbridge.shared",
    "~/Library/Preferences/com.xiangming.wechatbridge.plist",
    "~/Library/Saved Application State/com.xiangming.wechatbridge.savedState",
  ]
end
