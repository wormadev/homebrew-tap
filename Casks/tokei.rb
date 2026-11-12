cask "tokei" do
  version "0.1.5"
  sha256 "f556fe34580536fcb16dbcb017f619e31b8438f3476b65cb248ccb14ecab4f2b"

  url "https://github.com/wormadev/Tokei/releases/download/v#{version}/Tokei-#{version}.dmg"
  name "Tokei"
  desc "Menu bar usage for Claude and Codex plans"
  homepage "https://github.com/wormadev/Tokei"

  livecheck do
    url "https://github.com/wormadev/Tokei/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Tokei.app"

  uninstall quit: "com.wormadev.Tokei"

  zap trash: [
    "~/Library/Application Support/Tokei",
    "~/Library/Caches/com.wormadev.Tokei",
    "~/Library/HTTPStorages/com.wormadev.Tokei",
    "~/Library/Preferences/com.wormadev.Tokei.plist",
  ]
end
