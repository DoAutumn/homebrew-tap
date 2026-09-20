cask "doautumn-calendar" do
  version "1.0.4"
  sha256 "7ec9c990fca834fcf31cb6c261cb318e019e01237c136891dd2fb037adbdbf9d"

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

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Calendar.app"],
        must_succeed: false
  end

  uninstall quit: "io.github.calendar"

  zap trash: [
    "~/Library/Preferences/io.github.calendar.plist",
    "~/Library/Saved Application State/io.github.calendar.savedState",
  ]
end
