# vim:syntax=sh

basename="kicad"
latest="firstaftermatchword-trim"
opt_match="Stable release"
opt_nonmatch="release candidate"
baseurl="https://gitlab.com/kicad/code/kicad"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
version_holder="#version#"
#https://gitlab.com/kicad/code/kicad/-/archive/7.0.10/kicad-7.0.10.tar.bz2
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
