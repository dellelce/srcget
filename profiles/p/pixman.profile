# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="pixman"
baseurl="https://gitlab.freedesktop.org/pixman/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.gz"
sep='"'
opt_match="row-main-content"
version_holder="#version#"
custom_url="https://www.cairographics.org/releases/pixman-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment=""

## EOF ##
