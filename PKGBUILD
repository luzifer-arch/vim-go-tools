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
            '6da997a86ef6a4cce4c1ba46f1b07f820a806e05e5966b2dece5bfeefc774d36f0b0457093b43c6bb942aa2f6da6717bcd4f026b6e9f5692f03a1df99a9ab7d6')

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
