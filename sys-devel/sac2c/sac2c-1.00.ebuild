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
	dobin bin/sac2c
	dolib lib/*
	confdir=${D}/etc/sac/sac2c
	mkdir -p ${confdir}
	cp -r include ${confdir}
	cp LICENSE ${confdir}
	cp .revision.txt ${confdir}
	cp sac2crc ${confdir}
	cp -r setup ${confdir}

	# which sane program needs this symlinks
	ln -s /usr/lib ${confdir}/lib
	ln -s /usr/bin ${confdir}/bin

	mkdir -p ${D}/etc/env.d
	echo -e "#Environment variables for sac\n" > ${D}/etc/env.d/42sac
	echo -e "SACBASE=/etc/sac/\n" >> ${D}/etc/env.d/42sac
	# Sac2c fails at normal linux library loading so use the environment
	echo -e "SAC2CBASE=/etc/sac/sac2c\n" >> ${D}/etc/env.d/42sac
	echo -e "LD_LIBRARY_PATH=/usr/lib" >> ${D}/etc/env.d/42sac
}
