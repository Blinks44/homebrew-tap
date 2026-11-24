cask "hearth" do
  version "1.0.1"
  sha256 "1de694cc283f30384200a2aa49a73da64a4014ab41617140b45f1dbe9ae893cf"

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
