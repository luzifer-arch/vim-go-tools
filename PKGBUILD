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
            '0fc39a8c8523ac93c75ecdda6114825cb113495d150a072026df7bacb0c6f1cf2eda104ecbb3a8b003321e04a2f1a9f93eb658d196601590d42aac64566254db')

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
