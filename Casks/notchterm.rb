cask "notchterm" do
  version "2.1.4"
  sha256 "b4c822058a7c618377df3b3fb3558fa194b6d7f0e41a26bb9ac733712b5e62fe"

  url "https://github.com/DoAutumn/NotchTerm/releases/download/v#{version}/NotchTerm-#{version}.zip"
  name "NotchTerm"
  desc "Long-running iTerm tasks in the Mac notch — git, package builds, Cursor Agent"
  homepage "https://github.com/DoAutumn/NotchTerm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "NotchTerm.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/NotchTerm.app"]
  end

  uninstall quit: "com.doautumn.notchterm"

  zap trash: [
    "~/Library/Application Support/com.doautumn.notchterm",
    "~/Library/Preferences/com.doautumn.notchterm.plist",
    "~/Library/Saved Application State/com.doautumn.notchterm.savedState",
  ]
end
