cask "tokei" do
  version "0.1.1"
  sha256 "6e4cbafde2681bc9f7ec21bf9a89fd5de0e134e1500612b2bacb8aed4fc657d3"

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
