# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="pacman"
baseurl="https://gitlab.archlinux.org/pacman/pacman/"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="row-main-content"
version_holder="#version#"
#https://gitlab.archlinux.org/pacman/pacman/-/archive/v6.0.2/pacman-v6.0.2.tar.bz2
#https://www.cairographics.org/releases/pixman-6.0.2.tar.bz2
custom_url="${baseurl}/-/archive/v#version#/${basename}-v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment=""

## EOF ##
