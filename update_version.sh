#!/bin/bash
set -euo pipefail

function log() {
  echo "$@" >&2
}

pkgs=($(
  curl -sSfL "https://raw.githubusercontent.com/fatih/vim-go/master/plugin/go.vim" |
    grep -Eo "\\ \['[^']*/[^']*'" |
    tr -d "[' " |
    sort
))

versions=()

echo "### Packages from vim-go" >tools.txt.new

for pkg in "${pkgs[@]}"; do
  qpkg=${pkg%@*}
  ver=""
  while [[ -z $ver ]]; do
    log "-> Fetching version for '${qpkg}'..."
    ver=$(curl -sSf "https://proxy.golang.org/${qpkg}/@latest" | jq -r .Version || echo -n "")
    [[ -n $ver ]] || qpkg=${qpkg%/*}
  done
  log "---> Version for '${qpkg}' found as '${ver}'"

  versions+=("# GoProxy: ${qpkg} ${ver}")
  echo "${pkg}" >>tools.txt.new
done

echo -e "\n### Version checking for package rebuilds" >>tools.txt.new

curl -sSf https://archlinux.org/packages/extra/x86_64/go/json/ |
  jq -r '"# Archlinux: " + .pkgname + " v" + .pkgver + "-" + .pkgrel' >>tools.txt.new

for ver in "${versions[@]}"; do
  echo "${ver}" >>tools.txt.new
done

diff -u tools.txt tools.txt.new && {
  echo "Up to date"
  rm tools.txt.new
  exit 0
} || true

mv tools.txt.new tools.txt
updpkgsums

makepkg --printsrcinfo >.SRCINFO

git add tools.txt .SRCINFO PKGBUILD
git commit -m "Update tools $(date +%Y.%m.%d)"
