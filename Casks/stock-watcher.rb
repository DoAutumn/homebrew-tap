cask "stock-watcher" do
  version "0.1.3"
  sha256 "14bcb6ed98a88ac9690fb35e2b90267c36aeb91cc507f7a6aa427d6e05477328"

  url "https://github.com/DoAutumn/stock-watcher/releases/download/v#{version}/StockWatcher.app.zip"
  name "StockWatcher"
  desc "菜单栏 A 股自选行情：动态涨跌显示、列表浮层、详情 K 线"
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
