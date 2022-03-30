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
            'c730e0413f18b18a325c89a1818499e43b9089b73e0067aa5c4abaa85f543daebc0924e291f768771999484e03e585b63eece0fb10d10cd3d99a4c0364ea5ec5')

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
