#!/bin/bash
set -euo pipefail

packages=(
	github.com/alecthomas/gometalinter
	github.com/davidrjenni/reftools/cmd/fillstruct
	github.com/fatih/gomodifytags
	github.com/fatih/motion
	github.com/go-delve/delve/cmd/dlv
	github.com/golangci/golangci-lint/cmd/golangci-lint
	github.com/josharian/impl
	github.com/jstemmer/gotags
	github.com/kisielk/errcheck
	github.com/klauspost/asmfmt/cmd/asmfmt
	github.com/koron/iferr
	github.com/mdempsky/gocode
	github.com/rogpeppe/godef
	github.com/stamblerre/gocode
	github.com/zmb3/gogetdoc
	golang.org/x/lint/golint
	golang.org/x/tools/cmd/goimports
	golang.org/x/tools/cmd/gopls
	golang.org/x/tools/cmd/gorename
	golang.org/x/tools/cmd/guru
	honnef.co/go/tools/cmd/keyify
)

for package in "${packages[@]}"; do
	echo -e "\e[96mBuilding ${package}...\e[m" >&2
	go get -u -v "${package}"
done
