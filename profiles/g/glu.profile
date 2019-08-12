# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://gitlab.freedesktop.org/mesa/glu/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="Download source code"
version_holder="#version#"
#https://gitlab.freedesktop.org/mesa/glu/-/archive/glu-9.0.1/glu-glu-9.0.1.tar.bz2
custom_url="https://gitlab.freedesktop.org/mesa/glu/-/archive/glu-#version#/glu-glu-#version#.${extension_input}"
basename="glu"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
