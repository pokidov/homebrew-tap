cask "gopro-card" do
  version "1.0.0"
  sha256 "c365d2601747af62e6a9544ed2d6cba394e38a62c860c9dc563eef7f35ac4db7"

  url "https://github.com/pokidov/gopro-card/releases/download/v#{version}/GoProCard-#{version}.zip",
      verified: "github.com/pokidov/gopro-card/"
  name "GoPro Card"
  desc "Mount a GoPro over USB as a normal macOS volume"
  homepage "https://github.com/pokidov/gopro-card"

  depends_on macos: ">= :ventura"

  app "GoPro Card.app"

  caveats <<~EOS
    This build is ad-hoc signed rather than notarized, so macOS blocks the first launch
    with "cannot be opened because the developer cannot be verified".

    Approve it once in System Settings > Privacy & Security > Open Anyway, or clear the
    quarantine flag:

      xattr -dr com.apple.quarantine "/Applications/GoPro Card.app"

    A notarized build (Apple Developer ID) would remove this step.
  EOS

  uninstall launchctl: "com.gopromount.goprocard",
            quit:      "com.gopromount.goprocard"

  zap trash: [
    "~/Library/Application Support/GoPro Card",
    "~/Library/LaunchAgents/com.gopromount.goprocard.plist",
    "~/Library/Logs/GoProCard.log",
  ]
end
