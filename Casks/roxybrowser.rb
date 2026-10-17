cask "roxybrowser" do
  arch arm: "apple", intel: "intel"

  version "4.0.8"

  on_arm do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/apple/#{version}/RoxyBrowser_apple_#{version}.pkg"
    sha256 "0f58a3d8f1bd82075c903879cb3551c7570908c372dca557d5231cb8221ca312"
  end

  on_intel do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/intel/#{version}/RoxyBrowser_intel_#{version}.pkg"
    sha256 "fce2e572579ad06906e912d133a01a5c5274bf0dd294235e6c228669c946eb4b"
  end

  name "RoxyBrowser"
  desc "Browser with isolated profiles for managing multiple accounts"
  homepage "https://roxybrowser.com/"

  depends_on macos: :monterey

  pkg "RoxyBrowser_#{arch}_#{version}.pkg"

  uninstall pkgutil: "com.roxybrowser.app"
end
