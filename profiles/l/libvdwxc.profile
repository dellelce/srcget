# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://gitlab.com/libvdwxc/libvdwxc/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="ref-name"
version_holder="#version#"
#https://gitlab.com/libvdwxc/libvdwxc/-/archive/0.4.0/libvdwxc-0.4.0.tar.bz2
custom_url="https://gitlab.com/libvdwxc/libvdwxc/-/archive/#version#/libvdwxc-#version#.${extension_input}"
basename="libvdwxc"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
