cask "notchterm" do
  version "2.3.3"
  sha256 "3c690f426c720e1f197f70cf8afb4c8ad15ec03b1f3080a67fbb63ec02ff2fb7"

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
