# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="cairo"
srcurl="https://www.cairographics.org"
extension_input="tar.xz"
sep='"'
opt_match="Latest "
version_holder="#version#"
custom_url="${srcurl}/releases/cairo-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
