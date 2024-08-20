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
sha512sums=('5bf0f12f0836084a9a76a970cc605375b9cabead2450fd5ab2753c3604b3061568c2851e090516846c6920bd2dfd3843ff69453b6cc0a0faf72e3af348c40475'
            'e4d20425a4aa4abb93a2f3f1cf5bcf46d7002b4923a8a64c83a1778db6d05099cabf5276ca2feba6d30c727147cdd42bf4ba47a4b56013c1ddfdfaad373f36fe')

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
