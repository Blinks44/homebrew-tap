cask "hearth" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.1"
  sha256 arm:   "65126a2924de6e8d6bd1cd3cded7a0ef4615f5d5d542c7b5c681befc5c82c7e3",
         intel: "39f0be613f688f0d055152cd25f56a7f4c7d0f08b6f1ffb3c34be00d0036b930"

  url "https://github.com/Blinks44/hearth/releases/download/v#{version}/hearth-#{version}-#{arch}.dmg"
  name "Hearth"
  desc "Local desktop app for developer tools, versions, PATH, Docker, Kubernetes, and AI agents"
  homepage "https://hearth.moduix.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Hearth.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Hearth.app"]
  end

  zap trash: [
    "~/Library/Application Support/Hearth",
    "~/Library/Application Support/io.github.blinks44.hearth",
    "~/Library/Caches/Hearth",
    "~/Library/Caches/io.github.blinks44.hearth",
    "~/Library/Logs/Hearth",
    "~/Library/Preferences/io.github.blinks44.hearth.plist",
  ]

  caveats <<~EOS
    Hearth is currently signed ad hoc without Apple notarization.
    This cask removes the macOS quarantine attribute during installation so Hearth launches without Gatekeeper prompts.
  EOS
end
