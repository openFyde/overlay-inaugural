# Copyright (c) 2018 The Fyde OS Authors. All rights reserved.
# Distributed under the terms of the BSD

EAPI="7"

inherit udev user

DESCRIPTION="empty project"
HOMEPAGE="http://fydeos.com"

LICENSE="BSD-Google"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
  chromeos-base/chromeos-bsp-baseboard-inaugural
  chromeos-base/device-appid
  net-wireless/brcm_bt_patchrom
  chromeos-base/inaugural-firmware
  "

DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
  insinto "/usr/share/power_manager/board_specific"
  doins "${FILESDIR}"/powerd_prefs/*
  udev_dorules "${FILESDIR}/93-powerd-overrides.rules"
  udev_dorules "${FILESDIR}/wifi_init/99-start-wifi.rules"
  insinto /etc/init
  doins ${FILESDIR}/wifi_init/*.override
  exeinto /lib/udev
  doexe ${FILESDIR}/wifi_init/start_wifi.sh
  insinto /usr/share/alsa/ucm
  doins -r ${FILESDIR}/ucm-config/*
  insinto /etc/cras
  doins ${FILESDIR}/board.ini
}

pkg_preinst() {
  enewgroup tun
}
