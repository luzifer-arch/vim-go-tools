# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2020.05.31
pkgrel=1
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('c85e9c08cafb7a800a1eb4a8dc144503d73e00102d40219eaaf9d93f4b18fa5d2e1597722e37e00936d2315dd7f024fa6ac59b9a0f0a173e6e5570f3ef185dd9'
            '5b61b3aae11a294285af15f58f2de80015345cc0ca3ec8c49f3492e2a5ff45b6ada96a6d6b53abb44cb59fffa29efc4f58666b711bda35145a02dcafd81d77c7')

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
