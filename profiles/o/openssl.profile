# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.openssl.org/source/old/1.0.2/"
opt_match="KBytes"
basename="openssl"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://www.openssl.org/source/openssl-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
