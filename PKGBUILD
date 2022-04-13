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
            'd36ab4b0cd31040e10fe2633adf79e9d0db03553c55c500e9c7a48b2278a8de0c777659898d9ae0e169fdb1b41f7f85ee91ff49467212aef8749c89d8f5c34b2')

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
