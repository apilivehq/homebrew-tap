# Homebrew cask for the api.live desktop app, for the own tap apilivehq/homebrew-tap:
#   brew install --cask apilivehq/tap/api-live
# Rendered for v0.1.0 by `node scripts/packaging-update.mjs 0.1.0` from packaging/homebrew/Casks/api-live.rb (see docs/DISTRIBUTION.md).
# Not for homebrew/homebrew-cask yet: that repo only accepts apps that pass Gatekeeper (Developer ID
# signed + notarized) since 2026-09-01; resubmit there once the DMG is notarized.
cask "api-live" do
  version "0.1.0"
  sha256 "be7dbb9b4187e3652e9e2464fb3ba8ca80757abd9f8d70720fa84f3cad9d9337"

  url "https://github.com/apilivehq/apilive/releases/download/v#{version}/api.live_#{version}_universal.dmg"
  name "api.live"
  desc "Local-first API workbench, API simulator and load generator"
  homepage "https://api.live"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "api.live.app"

  # ~/Library/Application Support/api.live is shared with the `api` CLI (history, capture CA).
  zap trash: [
    "~/Library/Application Support/api.live",
    "~/Library/Application Support/live.api.desktop",
    "~/Library/Caches/live.api.desktop",
    "~/Library/Saved Application State/live.api.desktop.savedState",
    "~/Library/WebKit/live.api.desktop",
  ]
end
