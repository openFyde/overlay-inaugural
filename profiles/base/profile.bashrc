inaugural_stack_bashrc() {
  local cfg cfgd

  cfgd="/mnt/host/source/src/overlays/overlay-inaugural/${CATEGORY}/${PN}"
  for cfg in ${PN} ${P} ${PF} ; do
    cfg="${cfgd}/${cfg}.bashrc"
    [[ -f ${cfg} ]] && . "${cfg}"
  done

  export INAUGURAL_BASHRC_FILESDIR="${cfgd}/files"
}

inaugural_stack_bashrc
