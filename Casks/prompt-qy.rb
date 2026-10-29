cask "prompt-qy" do
  version "0.1.32"
  sha256 "7b04bcad775e552d37ecf5c8578bdc1df477e1f514ad915a1090d3fda4d30e88"

  url "https://github.com/DoAutumn/prompt-qy/releases/download/v#{version}/PromptQy.app.zip"
  name "PromptQy"
  desc "Menu-bar composer that feeds text, paths and screenshots to Claude Code"
  homepage "https://github.com/DoAutumn/prompt-qy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "PromptQy.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/PromptQy.app"]
  end

  uninstall quit: "io.github.promptqy"

  zap trash: [
    "~/Library/Preferences/io.github.promptqy.plist",
    "~/Library/Saved Application State/io.github.promptqy.savedState",
  ]
end
