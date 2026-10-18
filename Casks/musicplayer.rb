cask "musicplayer" do
  version "1.0.0"
  sha256 "461f4e025bae6e447d2d61a835160549a8b5f047ab9755eaf78e946e2280f52d"

  url "https://github.com/DoAutumn/MusicPlayer/releases/download/v#{version}/MusicPlayer-#{version}.zip"
  name "MusicPlayer"
  desc "Local music player for a folder of songs"
  homepage "https://github.com/DoAutumn/MusicPlayer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "MusicPlayer.app"

  # The app is not Apple-notarized, so Homebrew's quarantine flag would make
  # Gatekeeper refuse the first launch ("damaged, move to Trash"). Strip it here
  # rather than making every user remember `--no-quarantine` on install *and*
  # upgrade. Only possible in a third-party tap; homebrew-cask forbids this.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/MusicPlayer.app"]
  end

  uninstall quit: "com.doautumn.musicplayer"

  zap trash: [
    "~/Library/Preferences/com.doautumn.musicplayer.plist",
    "~/Library/Saved Application State/com.doautumn.musicplayer.savedState",
  ]
end
