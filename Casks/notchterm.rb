cask "notchterm" do
  version "2.4.0"
  sha256 "2086623d6a74eea99beae74da5b5d8c5a2f055b77e2f034b4743a613086f33a7"

  url "https://github.com/DoAutumn/NotchTerm/releases/download/v#{version}/NotchTerm-#{version}.zip"
  name "NotchTerm"
  desc "Cursor Agent, Claude Code, and long git/npm tasks in the Mac notch — hook-driven, no process scans"
  homepage "https://github.com/DoAutumn/NotchTerm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "NotchTerm.app"

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
