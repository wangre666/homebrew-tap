cask "roxybrowser" do
  version "4.0.7"

  on_arm do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/apple/#{version}/RoxyBrowser_apple_#{version}.pkg"
    sha256 "773208628a5be6282d7e5684dfdcee5e82525965d3c7fbbec38c3d6956ec9dee"
  end

  on_intel do
    url "https://sgp1.vultrobjects.com/roxybrowseross/private/package/app/macOS/intel/#{version}/RoxyBrowser_intel_#{version}.pkg"
    sha256 "759eefb7c7e1d77fec4fe0f661e3d47249face5434f70efa847089279dad3f4a"
  end

  name "RoxyBrowser"
  desc "Browser with isolated profiles for managing multiple accounts"
  homepage "https://roxybrowser.com/"

  depends_on macos: :monterey

  pkg "RoxyBrowser_*.pkg"

  uninstall pkgutil: "com.roxybrowser.app"
end
