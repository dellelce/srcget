# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="libvdwxc"
srcurl="https://gitlab.com/libvdwxc/libvdwxc/-/tags"
extension_input="tar.bz2"
opt_match="tag-icon"
version_holder="#version#"
#https://gitlab.com/libvdwxc/libvdwxc/-/archive/0.4.0/libvdwxc-0.4.0.tar.bz2
custom_url="https://gitlab.com/libvdwxc/libvdwxc/-/archive/#version#/libvdwxc-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
