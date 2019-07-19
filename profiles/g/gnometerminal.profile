# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="gnome-terminal"
baseurl="https://gitlab.gnome.org/GNOME/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="Download source code"
version_holder="#version#"
#https://gitlab.gnome.org/GNOME/gnome-terminal/-/archive/3.33.3/gnome-terminal-3.33.3.tar.bz2
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
