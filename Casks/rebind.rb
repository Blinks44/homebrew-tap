cask "rebind" do
  version "1.4.0"
  sha256 "c039f4cdfb4d8387b5fe5977c5d8d6064a79c0471b98943c903241c2a55ee56f"

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
