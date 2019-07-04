# vim:syntax=sh

latest="firstaftermatchword-underscorevers"
srcurl="https://gitlab.com/inkscape/inkscape/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="ref-name"
#https://gitlab.com/inkscape/inkscape/-/archive/INKSCAPE_0_92_4/inkscape-INKSCAPE_0_92_4.tar.bz2
version_holder="#version#"
custom_url="https://gitlab.com/inkscape/inkscape/-/archive/#version#/INKSCAPE_#version#.tar.bz2"
basename="inkscape"
#custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
