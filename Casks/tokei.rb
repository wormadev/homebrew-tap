cask "tokei" do
  version "0.1.6"
  sha256 "f1e9724e014b571d583b36374133b48e5ac3b426f8a15f992a10b3a78497b05d"

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
