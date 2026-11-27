cask "hearth" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.0"
  sha256 arm:   "0f322e8e53a1aacb6f7f4ac1797abc80851a53b730ab31a19d2cc4b818d0dca6",
         intel: "3f00620bc7cc7026236df7273bd61748e65a93a39e150b0cdc43c0e2ea40a146"

  url "https://github.com/Blinks44/hearth/releases/download/v#{version}/hearth-#{version}-#{arch}.dmg"
  name "Hearth"
  desc "Local desktop app for developer tools, versions, PATH, Docker, Kubernetes, and AI agents"
  homepage "https://hearth.moduix.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Hearth.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Hearth.app"]
  end

  caveats <<~EOS
    Hearth is currently signed ad hoc without Apple notarization.
    This cask removes the macOS quarantine attribute during installation so Hearth launches without Gatekeeper prompts.
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
