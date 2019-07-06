# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2019.07.06
pkgrel=1
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('225301ca5a3435d70a12628f55a6174487a59970596a23010c52b4e6554573a0bb9e16d01e4e08211cd1301272142acf195e1a7b97b0ee007ae8cbe757387d70'
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
