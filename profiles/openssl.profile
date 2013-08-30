# vim:syntax=sh


filter="awk/opensslvers.awk"
srcurl="http://www.openssl.org/source/"
extension_input="tar.gz"
# if set will be used to generate url
custom_url_prefix="${srcurl}openssl-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="openssl-"
custom_file_postfix=".${extension_input}"
sep='"'
