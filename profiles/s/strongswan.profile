# vim:syntax=sh

basename="strongswan"
latest="firstaftermatchword"
srcurl="https://www.strongswan.org/download.html"
extension_input="tar.bz2"
opt_match="Current Release"
version_holder="#version#"
custom_url="https://download.strongswan.org/strongswan-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
