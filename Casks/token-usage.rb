cask "token-usage" do
  version "0.4.0"
  sha256 "78287349e6026697e86a4af06e68f7eab1cc1ae6b7fd4e8772e0063b2fe10179"

  url "https://github.com/DoAutumn/token-usage/releases/download/v#{version}/TokenUsage.app.zip"
  name "TokenUsage"
  desc "Menu-bar widget showing Claude.ai usage, with a DeepSeek balance mode"
  homepage "https://github.com/DoAutumn/token-usage"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "TokenUsage.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TokenUsage.app"]
  end

  uninstall quit: "io.github.tokenusage"

  zap trash: [
    "~/Library/Preferences/io.github.tokenusage.plist",
    "~/Library/Saved Application State/io.github.tokenusage.savedState",
  ]
end
