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
            '5e44ddacda062e256718db4844606aa4492c703982281b741677cfebc288f3f450f407063ee0a5fc76180e49b974fa4f9ea58d1dbf25f374d12c551455da2e01')

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
