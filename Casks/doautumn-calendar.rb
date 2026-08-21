cask "doautumn-calendar" do
  version "1.0.1"
  sha256 "b9072111d03547605eae6ddc976f62178a4de99cce11c318fa68541c27e48d8c"

  url "https://github.com/DoAutumn/Calendar/releases/download/v#{version}/Calendar.app.zip"
  name "Calendar"
  desc "Menu-bar calendar with lunar dates, holidays and makeup workdays"
  homepage "https://github.com/DoAutumn/Calendar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "Calendar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Calendar.app"]
  end

  uninstall quit: "io.github.calendar"

  zap trash: [
    "~/Library/Preferences/io.github.calendar.plist",
    "~/Library/Saved Application State/io.github.calendar.savedState",
  ]
end
