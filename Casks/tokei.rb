cask "tokei" do
  version "0.1.2"
  sha256 "9a6b7e588299aa0d4b0b51dd175b321800cd8299bdc982f3c47be5f431ad22e6"

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

  # Not notarized yet (no Developer ID): without this, Gatekeeper refuses the first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tokei.app"]
  end

  uninstall quit: "com.wormadev.Tokei"

  zap trash: [
    "~/Library/Application Support/Tokei",
    "~/Library/Caches/com.wormadev.Tokei",
    "~/Library/HTTPStorages/com.wormadev.Tokei",
    "~/Library/Preferences/com.wormadev.Tokei.plist",
  ]
end
