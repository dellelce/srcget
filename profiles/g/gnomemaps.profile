# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="gnome-maps"
baseurl="https://gitlab.gnome.org/GNOME/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="Download source code"
version_holder="#version#"
#https://gitlab.gnome.org/GNOME/gnome-maps/-/archive/v3.33.4/gnome-maps-v3.33.4.tar.bz2
custom_url="${baseurl}/-/archive/v#version#/${basename}-v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
