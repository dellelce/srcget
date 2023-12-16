# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="xorgmacros"
theirname="util-macros"
baseurl="https://gitlab.freedesktop.org/xorg/util/macros"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
opt_match="Download source code"
version_holder="#version#"
#https://gitlab.freedesktop.org/xorg/util/macros/-/archive/util-macros-1.20.0/macros-util-macros-1.20.0.tar.bz2
custom_url="${baseurl}/-/archive/${theirname}-#version#/macros-${theirname}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
