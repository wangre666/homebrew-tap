cask "roxybrowser" do
  arch arm: "apple", intel: "intel"

  version "4.0.9"

  on_arm do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/apple/#{version}/RoxyBrowser_apple_#{version}.pkg"
    sha256 "e243b5783fb1a9aa499ab407a4f75f6a4a11c6e307e0036906cd666c007fe18e"
  end

  on_intel do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/intel/#{version}/RoxyBrowser_intel_#{version}.pkg"
    sha256 "8fd53aa66ba99d382944378f63625f237e0a003f602d5ad37fe8bf796f5f2067"
  end

  name "RoxyBrowser"
  desc "Browser with isolated profiles for managing multiple accounts"
  homepage "https://roxybrowser.com/"

  depends_on macos: :monterey

  pkg "RoxyBrowser_#{arch}_#{version}.pkg"

  uninstall pkgutil: "com.roxybrowser.app"
end
