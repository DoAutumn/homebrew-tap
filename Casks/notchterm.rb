cask "notchterm" do
  version "2.3.2"
  sha256 "62e0b36a2fd013a49f9533633ecc923141596a5d63f2d3ed2e9abdf183922c2b"

  url "https://github.com/DoAutumn/NotchTerm/releases/download/v#{version}/NotchTerm-#{version}.zip"
  name "NotchTerm"
  desc "Cursor Agent and long git/npm tasks in the Mac notch — hook-driven, no process scans"
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
