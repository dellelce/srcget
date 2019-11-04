# vim:syntax=sh

latest="firstaftermatchword"
srcurl="https://scons.org/pages/download.html"
comment=""
opt_match="The current production release"
extension_input="tar.gz"
basename="scons"
version_holder="#version#"
#http://prdownloads.sourceforge.net/scons/scons-3.1.1.tar.gz
custom_url="http://prdownloads.sourceforge.net/scons/scons-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
