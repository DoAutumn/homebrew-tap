cask "renotch" do
  version "2.0.0"
  sha256 "8d09617f24b83b822b343e19bacbfd57a70d1673d4337ae6323b8c6529f9d4c5"

  url "https://github.com/DoAutumn/renotch/releases/download/v#{version}/Re-notch-#{version}.zip"
  name "Re:notch"
  desc "iTerm long-task monitor for the Mac notch"
  homepage "https://github.com/DoAutumn/renotch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Re:notch.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Re:notch.app"]
  end

  uninstall quit: "com.doautumn.renotch"

  zap trash: [
    "~/Library/Preferences/com.doautumn.renotch.plist",
    "~/Library/Saved Application State/com.doautumn.renotch.savedState",
  ]
end
