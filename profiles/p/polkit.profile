# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://gitlab.freedesktop.org/polkit/polkit/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="Download source code"
version_holder="#version#"
#https://gitlab.freedesktop.org/polkit/polkit/-/archive/0.116/polkit-0.116.tar.bz2
custom_url="https://gitlab.freedesktop.org/polkit/polkit/-/archive/#version#/polkit-#version#.${extension_input}"
basename="polkit"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
