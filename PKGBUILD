# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2020.05.31
pkgrel=2
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('2e35b839ced6ea6ec62bcc5e728740844a30790286ff088dd424f1f4a2a30157fef9078346abaf2c84ba3cef8fdffe135c2e7adb422cb69536d754df812d755b'
            '5279bbbdb3001399995c4e0387b4106c55152e1c85fa1e8785db0e0d27c5ab5c4ad267ac4e1a0138758fd9a4ae2c6237a757d2db00fa4b72850580048edacd99')

build() {
	mkdir -p "${srcdir}/go"
	GOPATH="${srcdir}/go" bash "${srcdir}/build.sh"
}

package() {
	for binary in "${srcdir}/go/bin/"*; do
		install -Dm755 "${srcdir}/go/bin/$(basename ${binary})" "${pkgdir}/usr/bin/$(basename ${binary})"
	done
}

pkgver() {
	date +"%Y.%m.%d"
}
