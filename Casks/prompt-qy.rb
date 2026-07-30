cask "prompt-qy" do
  version "0.1.11"
  sha256 "08a7b49a38ee8dda9948959b69d3007bc563f166f4cb61cc2b3a33aaa154213f"

  url "https://github.com/DoAutumn/prompt-qy/releases/download/v#{version}/PromptQy.app.zip"
  name "PromptQy"
  desc "Menu-bar composer that feeds text, paths and screenshots to Claude Code"
  homepage "https://github.com/DoAutumn/prompt-qy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "PromptQy.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PromptQy.app"]
  end

  uninstall quit: "io.github.promptqy"

  zap trash: [
    "~/Library/Preferences/io.github.promptqy.plist",
    "~/Library/Saved Application State/io.github.promptqy.savedState",
  ]
end
