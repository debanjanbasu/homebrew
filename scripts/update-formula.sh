#!/usr/bin/env bash
# Regenerate Formula/grr.rb from the latest grr-cli GitHub release.
#
# Runs inside this tap's own workflow: the release metadata and SHA256SUMS are
# public, so no cross-repo token is needed. Called by
# .github/workflows/update-grr.yml; runnable locally too.
set -euo pipefail
cd "$(dirname "$0")/.."

repo="debanjanbasu/grr-cli"
tag="$(gh api "repos/$repo/releases/latest" --jq .tag_name)"
ver="${tag#v}"
base="https://github.com/$repo/releases/download/$tag"

# Windows has no Homebrew, so only the macOS and Linux tarballs are referenced.
sums="$(curl -fsSL "$base/SHA256SUMS")"
asset_sha() {
  printf '%s\n' "$sums" | awk -v name="grr-${ver}-$1.tar.zst" '$2 == name { print $1 }'
}
mac="$(asset_sha macos-aarch64)"
lx64="$(asset_sha linux-x86_64)"
larm="$(asset_sha linux-aarch64)"
for pair in "macOS arm64:$mac" "Linux x86_64:$lx64" "Linux arm64:$larm"; do
  case "$pair" in
    *:) echo "::error::missing asset or checksum for ${pair%%:*}"; exit 1 ;;
  esac
done

cat > Formula/grr.rb <<FORMULA
class Grr < Formula
  desc "Google tools from the terminal, at maximum performance (Gmail, Calendar, Drive, Contacts, Chat, Forms)"
  homepage "https://grr-cli.pages.dev"
  version "$ver"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "$base/grr-${ver}-macos-aarch64.tar.zst"
    sha256 "$mac"
  end

  on_linux do
    on_arch :arm do
      url "$base/grr-${ver}-linux-aarch64.tar.zst"
      sha256 "$larm"
    end
    on_arch :x86_64 do
      url "$base/grr-${ver}-linux-x86_64.tar.zst"
      sha256 "$lx64"
    end
  end

  def install
    bin.install "grr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/grr --version")
  end
end
FORMULA
