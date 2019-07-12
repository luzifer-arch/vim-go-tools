# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2019.07.12
pkgrel=1
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('ee180fa557e4fe57003a67d4fe19747c6452d5fb39de78265827bfd4baa3aff26ebd8984ebc3cf0d7b22342d66dbd7bccf9d8adecc3498fe0d496376ef5d3e86'
            '22f980e0cbceef4a8782b0c544d7d0601e90c35aef45b6098888fe1c479f8b1089011a00ce3557fe3617076cb991875274a36a06417b673b9c593fb7f73ecb7d')

build() {
	mkdir -p "${srcdir}/go"
	GOPATH="${srcdir}/go" bash "${srcdir}/build.sh"
}

package() {
	for binary in "${srcdir}/go/bin/"*; do
		install -Dm755 "${srcdir}/go/bin/$(basename ${binary})" "${pkgdir}/usr/bin/$(basename ${binary})"
	done
}
