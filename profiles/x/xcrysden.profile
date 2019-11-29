# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.xcrysden.org/Download.html"
comment="Crystalline- and molecular-structure visualization program"
opt_match="Latest version"
extension_input="tar.gz"
basename="xcrysden"
version_holder="#version#"
#http://www.xcrysden.org/download/xcrysden-1.6.2.tar.gz
custom_url="http://www.xcrysden.org/download/xcrysden-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
