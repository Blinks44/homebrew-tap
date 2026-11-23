cask "monny" do
  version "1.8.2"
  sha256 "d1542a8d25b00687b57e798fbb3b4ec0026ce15f9270d504a0cf5f6877ec95f7"

  url "https://github.com/Blinks44/monny/releases/download/v#{version}/Monny.dmg"
  name "Monny"
  desc "Native macOS menu bar system monitor, battery charge limit, and AI quota tracker"
  homepage "https://monny.moduix.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Monny.app"

  caveats <<~EOS
    Monny is signed without Apple notarization.
    If macOS blocks the first launch, open System Settings -> Privacy & Security
    and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine /Applications/Monny.app
  EOS

  zap trash: [
    "~/Library/Application Support/Monny",
    "~/Library/Caches/blinks44.monny",
    "~/Library/HTTPStorages/blinks44.monny",
    "~/Library/Preferences/blinks44.monny.plist",
    "~/Library/Saved Application State/blinks44.monny.savedState",
  ]
end
