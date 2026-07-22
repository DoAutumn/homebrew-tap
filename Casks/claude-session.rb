cask "claude-session" do
  version "26.07.1"
  sha256 "ba7438934b4465003af82c1d333315d537e4636e3a8cb22980014f4b8fa95aa8"

  url "https://github.com/DoAutumn/session/releases/download/v#{version}/Session.app.zip"
  name "Session"
  desc "Native macOS companion for Claude Code and Cursor sessions"
  homepage "https://github.com/DoAutumn/session"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Session.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Session.app"]
  end

  uninstall quit: "fyi.session"

  zap trash: [
    "~/Library/Preferences/fyi.session.plist",
    "~/Library/Caches/fyi.session",
    "~/Library/Saved Application State/fyi.session.savedState",
  ]
end
