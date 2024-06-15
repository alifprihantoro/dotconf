pdf() {
  local LIST_DISTRO=$(find ./installed-rootfs/ -maxdepth 1 -type d -name "*" -print | sed 's/.\/installed-rootfs\///g' | fzf)
  if [ ! -z "$LIST_DISTRO" ]; then
    proot-distro login $LIST_DISTRO
  fi
}
