# vim:syntax=sh

basename="smoldyn"
latest="firstaftermatchword"
srcurl="http://www.smoldyn.org/download.html"
extension_input="tgz"
extension="tar.gz"
opt_match="Current version:"
version_holder="#version#"
custom_url="http://www.smoldyn.org/smoldyn-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension}"

## EOF ##
