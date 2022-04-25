# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

EAPI="5"

inherit udev

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
  chromeos-base/chromeos-bsp-baseboard-inaugural
  chromeos-base/device-appid
  "

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
  insinto "/usr/share/power_manager/board_specific"
  doins "${FILESDIR}"/powerd_prefs/*
  udev_dorules "${FILESDIR}/93-powerd-overrides.rules"
  insinto /lib/firmware
  doins -r ${FILESDIR}/firmware/*
  insinto /etc/init
  doins ${FILESDIR}/ethernet_issue_workaround.conf
}
