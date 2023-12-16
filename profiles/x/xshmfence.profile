# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="xshmfence"
theirname="libxshmfence"
baseurl="https://gitlab.freedesktop.org/xorg/lib/libxshmfence"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
opt_match="Download source code"
version_holder="#version#"
#https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/archive/libxshmfence-1.3.2/libxshmfence-libxshmfence-1.3.2.tar.bz2
custom_url="${baseurl}/-/archive/${theirname}-#version#/${theirname}-${theirname}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
