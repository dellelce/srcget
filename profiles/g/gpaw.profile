# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="gpaw"
baseurl="https://gitlab.com/gpaw/gpaw"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="Version"
version_holder="#version#"
# https://gitlab.com/gpaw/gpaw/-/archive/19.8.1/gpaw-19.8.1.tar.bz2
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
