cask "monny" do
  version "1.8.3"
  sha256 "654b08cbfdf8a97a1b64679a7ce289538ae60fa1edfeeb80765355b3c058b5f0"

  url "https://github.com/Blinks44/monny/releases/download/v#{version}/Monny.dmg"
  name "Monny"
  desc "Menu bar system monitor, battery charge limit, and AI quota tracker"
  homepage "https://monny.moduix.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Monny.app"

  zap trash: [
    "~/Library/Application Support/Monny",
    "~/Library/Caches/blinks44.monny",
    "~/Library/HTTPStorages/blinks44.monny",
    "~/Library/Preferences/blinks44.monny.plist",
    "~/Library/Saved Application State/blinks44.monny.savedState",
  ]

  caveats <<~EOS
    Monny is signed without Apple notarization.
    If macOS blocks the first launch, open System Settings -> Privacy & Security
    and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine /Applications/Monny.app
  EOS
end
