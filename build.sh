#!/bin/bash
set -euo pipefail

packages=($(cat tools.txt))

for package in "${packages[@]}"; do
	echo -e "\e[96mBuilding ${package}...\e[m" >&2
	go get -u -v "${package%@*}"
done
