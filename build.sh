#!/bin/bash
set -euo pipefail

# Force module mode to support "@version" syntax
export GO111MODULE=on

# Remove mod-cache on exit as its permissions are FUBAR
trap "go clean -modcache" EXIT

packages=($(grep -v "^#" tools.txt))

for package in "${packages[@]}"; do
  echo -e "\e[96mBuilding ${package}...\e[m" >&2
  go install "${package}"
done
