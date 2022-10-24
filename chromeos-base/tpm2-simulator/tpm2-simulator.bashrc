# Copyright (c) 2022 Fyde Innovations Limited and the openFyde Authors.
# Distributed under the license specified in the root directory of this project.

cros_pre_src_prepare_inaugural() {
  eapply -p1 ${INAUGURAL_BASHRC_FILESDIR}/skip-selinux_restorecon.patch
}
