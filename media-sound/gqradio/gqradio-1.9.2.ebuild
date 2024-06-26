# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="An FM radio tuner app from the people who brought you GQmpeg"
HOMEPAGE="https://gqmpeg.sourceforge.net/radio.html"
SRC_URI="https://downloads.sourceforge.net/gqmpeg/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"

RDEPEND=">=x11-libs/gtk+-2.4:2"
DEPEND="${RDEPEND}"
BDEPEND="
	sys-devel/gettext
	virtual/pkgconfig"

PATCHES=(
	"${FILESDIR}"/${P}-underlinking.patch
	"${FILESDIR}"/${P}-desktop-QA.patch
)

src_prepare() {
	default
	mv configure.{in,ac} || die
	eautoreconf
}
