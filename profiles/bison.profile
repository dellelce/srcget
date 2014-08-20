# vim:syntax=sh

filter="awk/bison.latest.awk"
srcurl="http://ftp.gnu.org/gnu/bison"
extension_input="tar.xz"
basename="bison"
custom_url_prefix="${srcurl}/${basename}-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
sep='"'
