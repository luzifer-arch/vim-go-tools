# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=vim-go-tools
pkgver=2019.06.12
pkgrel=1
pkgdesc="Package of tools required by vim-go"
arch=('x86_64')
url="https://github.com/fatih/vim-go"
license=(other)
makedepends=('go')
source=("build.sh" "tools.txt")
sha512sums=('225301ca5a3435d70a12628f55a6174487a59970596a23010c52b4e6554573a0bb9e16d01e4e08211cd1301272142acf195e1a7b97b0ee007ae8cbe757387d70'
            '751a9bf8bbea2fac37f4a9e405e2a5020ad0880b353ea9467d54f0a1a31dd321e8f860fc32646c463e2142f46c4b82826e426a872a71752cb63b32ad34393e1e')

build() {
	mkdir -p "${srcdir}/go"
	GOPATH="${srcdir}/go" bash "${srcdir}/build.sh"
}

package() {
	for binary in "${srcdir}/go/bin/"*; do
		install -Dm755 "${srcdir}/go/bin/$(basename ${binary})" "${pkgdir}/usr/bin/$(basename ${binary})"
	done
}
