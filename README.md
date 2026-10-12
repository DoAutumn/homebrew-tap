# DoAutumn's Homebrew Tap

Personal Homebrew tap.

## Casks

| Cask | Description |
|---|---|
| [`notchterm`](Casks/notchterm.rb) | Long-running iTerm tasks in the Mac notch (git, package builds, Cursor Agent) |
| [`prompt-qy`](Casks/prompt-qy.rb) | Menu-bar composer that feeds text, paths and screenshots to Claude Code |
| [`autoclaude`](Casks/autoclaude.rb) | Menu-bar scheduler that sends a daily message to Claude Code in Terminal |
| [`stock-watcher`](Casks/stock-watcher.rb) | Menu-bar always-on-top watchlist widget for A-share stock quotes |
| [`claude-session`](Casks/claude-session.rb) | Native macOS companion for Claude Code and Cursor sessions |
| [`doautumn-calendar`](Casks/doautumn-calendar.rb) | Menu-bar calendar with lunar dates and holidays |
| [`token-usage`](Casks/token-usage.rb) | Menu-bar widget showing Claude.ai usage |

## Usage

```bash
brew install --cask doautumn/tap/notchterm   # install (taps automatically)
brew upgrade --cask notchterm                # update
brew uninstall --zap --cask notchterm        # uninstall + remove preferences
```

Substitute any cask name from the table above.
