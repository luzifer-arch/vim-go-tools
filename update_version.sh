#!/bin/bash
set -euo pipefail

curl -sSf https://archlinux.org/packages/extra/x86_64/go/json/ |
  jq -r '"# " + .pkgname + " v" + .pkgver + "-" + .pkgrel' >tools.txt.new

curl -sSfL "https://raw.githubusercontent.com/fatih/vim-go/master/plugin/go.vim" |
  grep -Eo "\\ \['[^']*/[^']*'" |
  tr -d "[' " |
  sort >>tools.txt.new

diff tools.txt tools.txt.new && {
  echo "Up to date"
  rm tools.txt.new
  exit 0
} || true

mv tools.txt.new tools.txt
updpkgsums

makepkg --printsrcinfo >.SRCINFO

git add tools.txt .SRCINFO PKGBUILD
git commit -m "Update tools $(date +%Y.%m.%d)"
