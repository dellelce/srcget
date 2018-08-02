# vim:syntax=sh

latest="awk/lzip.latest.awk"
srcurl="http://download.savannah.gnu.org/releases/lzip"
comment=""
basename="lzip"
extension_input="tar.gz"
#http://download.savannah.gnu.org/releases/lzip/lzip-1.20.tar.gz
baseurl="${srcurl}"
version_holder="#version#"
custom_url="${baseurl}/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
