# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

JAVA_PKG_IUSE="doc source examples"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="A Structured 2D Graphics Framework"
HOMEPAGE="https://github.com/piccolo2d/piccolo2d.java"
SRC_URI="https://github.com/${PN}/${PN}.java/archive/${PN}-complete-${PV}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc64 x86"
IUSE=""

CDEPEND="dev-java/swt:3.8"

RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.6"

DEPEND="
	${CDEPEND}
	app-arch/unzip
	>=virtual/jdk-1.6"

S="${WORKDIR}/${PN}.java-${PN}-complete-${PV}"
JAVA_GENTOO_CLASSPATH="swt-3.8"
JAVA_SRC_DIR="core extras swt"

java_prepare() {
	rm -rf core/src/test extras/src/test swt/src/test || die
}

src_install() {
	java-pkg-simple_src_install
	dodoc Readme.txt ReleaseNotes.txt

	if use examples; then
		docinto examples
		dodoc -r examples/src/main/java/org/piccolo2d/examples/*
		dodoc -r examples/src/main/java/org/piccolo2d/tutorial
		dodoc -r swt-examples/src/main/java/org/piccolo2d/extras
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
