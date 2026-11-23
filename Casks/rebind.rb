cask "rebind" do
  version "1.3.2"
  sha256 "170b3a3f2ddd7aaaaeff03fbc32675995e8d9658439cbec33ebc21b745999e85"

  url "https://github.com/Blinks44/rebind/releases/download/v#{version}/Rebind.dmg"
  name "Rebind"
  desc "Remap keys, mouse buttons, trackpad gestures, and Logitech controls"
  homepage "https://rebind.moduix.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Rebind.app"

  zap trash: [
    "~/Library/Application Support/Rebind",
    "~/Library/Caches/blinks44.rebind",
    "~/Library/Preferences/blinks44.rebind.plist",
    "~/Library/Saved Application State/blinks44.rebind.savedState",
  ]

  caveats <<~EOS
    Rebind is open-source software and is not notarized by Apple.
    If Gatekeeper blocks the first launch, clear the quarantine attribute:
      xattr -dr com.apple.quarantine /Applications/Rebind.app
    Rebind also asks for Accessibility permission on first launch.
  EOS
end
