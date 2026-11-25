cask "hearth" do
  version "1.0.4"
  sha256 "5563db6b61ad788a523a751f971a4446a80865652a3d44e58cdf55a168e163c1"

  url "https://github.com/Blinks44/hearth/releases/download/v#{version}/hearth-#{version}.dmg"
  name "Hearth"
  desc "Local desktop app for developer tools, versions, PATH, Docker, Kubernetes, and AI agents"
  homepage "https://hearth.moduix.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Hearth.app"

  caveats <<~EOS
    Hearth is currently signed ad hoc without Apple notarization.
    If macOS blocks the first launch, open System Settings -> Privacy & Security
    and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine /Applications/Hearth.app
  EOS

  zap trash: [
    "~/Library/Application Support/Hearth",
    "~/Library/Application Support/io.github.blinks44.hearth",
    "~/Library/Caches/Hearth",
    "~/Library/Caches/io.github.blinks44.hearth",
    "~/Library/Logs/Hearth",
    "~/Library/Preferences/io.github.blinks44.hearth.plist",
  ]
end
