# pokidov's Homebrew tap

```bash
brew tap pokidov/tap
brew trust pokidov/tap
brew install --cask gopro-card
```

## gopro-card

Mounts a GoPro over USB as an ordinary macOS volume — no card reader, no import queue.
Source: <https://github.com/pokidov/gopro-card>

The build is ad-hoc signed (no Developer ID), so macOS blocks the first launch. Approve it
once in **System Settings ▸ Privacy & Security ▸ Open Anyway**, or clear the flag:

```bash
xattr -dr com.apple.quarantine "/Applications/GoPro Card.app"
```

Uninstall: `brew uninstall --cask gopro-card` · clean everything: `brew uninstall --zap --cask gopro-card`
