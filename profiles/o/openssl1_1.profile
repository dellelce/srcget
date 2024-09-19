# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.openssl.org/source/"
opt_match="download/"
extension_input="tar.gz"
basename="openssl"
sep='"'
version_holder="#version#"
#https://github.com/openssl/openssl/releases/download/openssl-3.3.2/openssl-3.3.2.tar.gz
custom_url="https://github.com/openssl/openssl/releases/download/openssl-#version#/openssl-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
