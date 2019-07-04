# vim:syntax=sh

latest="firstaftermatchword"
srcurl="https://libzip.org"
extension_input="tar.xz"
opt_match="Current version is"
#https://libzip.org/download/libzip-1.5.2.tar.gz
baseurl="${srcurl}/download"
basename="libzip"
custom_url_prefix="${baseurl}/${basename}-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
