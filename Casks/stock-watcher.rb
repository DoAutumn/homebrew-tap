cask "stock-watcher" do
  version "0.1.2"
  sha256 "ff58c5898b4cfb756baec411e3cf6ccae6d996276ccea9f4fbd106d8c8f7d508"

  url "https://github.com/DoAutumn/stock-watcher/releases/download/v#{version}/StockWatcher.app.zip"
  name "StockWatcher"
  desc "菜单栏常驻的自选股行情浮窗：全局快捷键呼出/隐藏、边缘贴靠自动隐藏、K线图"
  homepage "https://github.com/DoAutumn/stock-watcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "StockWatcher.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/StockWatcher.app"]
  end

  uninstall quit: "io.github.stock-watcher"

  zap trash: [
    "~/Library/Preferences/io.github.stock-watcher.plist",
    "~/Library/Saved Application State/io.github.stock-watcher.savedState",
  ]
end
