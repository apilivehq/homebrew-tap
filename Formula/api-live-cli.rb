# Homebrew formula for the `api` CLI + MCP server (`api mcp`), for the own tap apilivehq/homebrew-tap:
#   brew install apilivehq/tap/api-live-cli
# Rendered for v0.1.0 by `node scripts/packaging-update.mjs 0.1.0` from packaging/homebrew/Formula/api-live-cli.rb (see docs/DISTRIBUTION.md).
# A formula that installs a prebuilt proprietary binary is fine in an own tap; homebrew/core only takes
# open-source software built from source, so this never goes there.
class ApiLiveCli < Formula
  desc "Local-first API workbench, simulator and load generator (CLI and MCP server)"
  homepage "https://api.live"
  version "0.1.0"
  license :cannot_represent # proprietary, free to use: see LICENSE.md in the archive

  livecheck do
    url "https://github.com/apilivehq/apilive"
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/apilivehq/apilive/releases/download/v#{version}/api-darwin-arm64.tar.gz"
      sha256 "3753d44cae3946d94cfdbf736c64b63be555699cf4505893d1549262d469cef6"
    end
    on_intel do
      url "https://github.com/apilivehq/apilive/releases/download/v#{version}/api-darwin-x64.tar.gz"
      sha256 "70419683c52709ed038fc17eb422b7b1db3cddc14976cd2d8a38786cfd5ad06c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/apilivehq/apilive/releases/download/v#{version}/api-linux-arm64.tar.gz"
      sha256 "f3f0e4f6444a2e529fd740bf13e70d9444ca23e5fddc26d5fb7219df1b5918e2"
    end
    on_intel do
      url "https://github.com/apilivehq/apilive/releases/download/v#{version}/api-linux-x64.tar.gz"
      sha256 "fb171ecc9045556799d6114b31a9a5a1c37b5910ff0f405f36dbd0dca9359a3b"
    end
  end

  def install
    bin.install "api"
    prefix.install "LICENSE.md"
    doc.install "THIRD-PARTY-NOTICES.md"
  end

  def caveats
    <<~EOS
      MCP server for AI agents (stdio):
        { "mcpServers": { "api.live": { "command": "#{opt_bin}/api", "args": ["mcp", "-w", "/path/to/workspace"] } } }
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/api --version")
  end
end
