# vim:syntax=sh

latest="github"
basename="libucl"
baseurl="https://github.com/vstakhov/libucl"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
#https://github.com/vstakhov/libucl/archive/refs/tags/0.8.2.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
