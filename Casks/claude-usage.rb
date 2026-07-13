cask "claude-usage" do
  version "0.3.0"
  sha256 "480cf9c76a4e3ff56d4e042f25762ab82f6d812fab06ec0b50b46d7b18897197"

  url "https://github.com/DoAutumn/claude-desktop-usage/releases/download/v#{version}/Claude-Usage.app.zip"
  name "Claude Usage"
  desc "Menu-bar widget showing Claude.ai usage, with a DeepSeek balance mode"
  homepage "https://github.com/DoAutumn/claude-desktop-usage"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Claude Usage.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Usage.app"]
  end

  uninstall quit: "io.github.claude-desktop-usage"

  zap trash: [
    "~/Library/Preferences/io.github.claude-desktop-usage.plist",
    "~/Library/Saved Application State/io.github.claude-desktop-usage.savedState",
  ]
end
