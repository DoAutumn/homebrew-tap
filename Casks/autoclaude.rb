cask "autoclaude" do
  version "0.1.0"
  sha256 "c9990a9ff0db00ed81f9bbf234aafbe0eaf75e261e184f5a5c8d7d55eafd012f"

  url "https://github.com/DoAutumn/AutoClaude/releases/download/v#{version}/AutoClaude.app.zip"
  name "AutoClaude"
  desc "Menu-bar scheduler that sends a daily message to Claude Code in Terminal"
  homepage "https://github.com/DoAutumn/AutoClaude"

  livecheck do
    url :url
    strategy :github_latest
  end

  # SMAppService, used for the launch-at-login toggle, needs macOS 13.
  depends_on macos: ">= :ventura"

  app "AutoClaude.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AutoClaude.app"]
  end

  uninstall quit: "com.doautumn.autoclaude"

  zap trash: [
    "~/Library/Preferences/com.doautumn.autoclaude.plist",
    "~/Library/Saved Application State/com.doautumn.autoclaude.savedState",
  ]
end
