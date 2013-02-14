# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Single Assignment C to C Compiler"
HOMEPAGE="http://www.sac-home.org"
SRC_URI="http://geeser.chickenkiller.com/${P}.tbz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	sys-devel/gcc
	sys-devel/bison
	sys-devel/flex
	"

RDEPEND="
	${DEPEND}
	"


src_install() {
	dobin bin/*
}
