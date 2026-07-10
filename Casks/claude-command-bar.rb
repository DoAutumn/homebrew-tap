cask "claude-command-bar" do
  version "0.1.1"
  sha256 "33fc613730907847da4d63f58c2bf481803416d523d9f97d41854178395c24a9"

  url "https://github.com/DoAutumn/claude-command-bar/releases/download/v#{version}/Claude-Command-Bar.app.zip"
  name "Claude Command Bar"
  desc "Menu-bar composer that feeds text, paths and screenshots to Claude Code"
  homepage "https://github.com/DoAutumn/claude-command-bar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Claude Command Bar.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Command Bar.app"]
  end

  uninstall quit: "io.github.claude-command-bar"

  zap trash: [
    "~/Library/Preferences/io.github.claude-command-bar.plist",
    "~/Library/Saved Application State/io.github.claude-command-bar.savedState",
  ]
end
