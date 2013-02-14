# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Standard library for Single Assignment C"
HOMEPAGE="http://www.sac-home.org"
SRC_URI="http://geeser.chickenkiller.com/${P}.tbz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-devel/sac2c"
RDEPEND=""

src_prepare() {
	export SACBASE="`pwd`"
	export SAC2CBASE="`pwd`/sac2c"
	ln -s /etc/sac/sac2c sac2c
}

src_configure() {
	cd stdlib
	econf
}

src_compile() {
	cd stdlib
	nonfatal emake mtfast || nonfatal emake mtfast || nonfatal emake mtfast ||
	nonfatal emake mtfast || nonfatal emake mtfast || die "retry count exceeded"
}

src_install() {
	dolib.so stdlib/world/stdio/lib/*.so	
}

pkg_info() {
	ewarn "Make with -j isn't stable yet"
	ewarn "This ebuild will restart emake 5 times for above reason"
	ewarn "If it still crashes, compile without -j flag"
}
