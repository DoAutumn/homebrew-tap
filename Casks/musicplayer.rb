cask "musicplayer" do
  version "1.0.5"
  sha256 "35271dae1c248311f85fe71fe017f4d16ae3c3f8eac8fe985bdc51f005b28b6c"

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
