# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.openssl.org/source/"
opt_match="KBytes"
opt_nonmatch="alpha"
extension_input="tar.gz"
basename="openssl"
sep='"'
version_holder="#version#"
custom_url="https://www.openssl.org/source/openssl-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
