cask "roxybrowser" do
  arch arm: "apple", intel: "intel"

  version "4.1.0"

  on_arm do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/apple/#{version}/RoxyBrowser_apple_#{version}.pkg"
    sha256 "7e989fea2cceba0f6d13ff93330b934c8a9f34102e4fa110e9d6e0b5768e94d3"
  end

  on_intel do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/intel/#{version}/RoxyBrowser_intel_#{version}.pkg"
    sha256 "52a048f0e871bcdd5b7e05ad1d6a1b2e61908555f4d7fd928c6a3ca22473a7f0"
  end

  name "RoxyBrowser"
  desc "Browser with isolated profiles for managing multiple accounts"
  homepage "https://roxybrowser.com/"

  depends_on macos: :monterey

  pkg "RoxyBrowser_#{arch}_#{version}.pkg"

  uninstall pkgutil: "com.roxybrowser.app"
end
