# vim:syntax=sh

filter="awk/iconv.latest.awk"
srcurl="http://ftp.gnu.org/pub/gnu/libiconv"
baseurl="$srcurl"
extension_input="tar.gz"
custom_url_prefix="${srcurl}/libiconv-"
custom_url_postfix=".${extension_input}"
custom_file_postfix=".${extension_input}"
custom_file_prefix="libiconv-"
sep='"'
