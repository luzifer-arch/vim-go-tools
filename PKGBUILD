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
            '6fb74eb3991ec87a1cbed71a31e9276771f29237df624abbc08eed4e721afc1d11dd2cf86bb4ef8ddc1e2ab1f39f9a083391a4df547bdd1d6547de0c78d142ef')

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
