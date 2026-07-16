# DoAutumn's Homebrew Tap

Personal Homebrew tap.

## Casks

| Cask | Description |
|---|---|
| [`claude-command-bar`](Casks/claude-command-bar.rb) | Menu-bar composer that feeds text, paths and screenshots to Claude Code |
| [`autoclaude`](Casks/autoclaude.rb) | Menu-bar scheduler that sends a daily message to Claude Code in Terminal |
| [`stock-watcher`](Casks/stock-watcher.rb) | Menu-bar always-on-top watchlist widget for A-share stock quotes |

## Usage

```bash
brew install --cask DoAutumn/tap/claude-command-bar   # install (taps automatically)
brew upgrade --cask claude-command-bar                # update
brew uninstall --zap --cask claude-command-bar        # uninstall + remove preferences
```

Substitute any cask name from the table above.
