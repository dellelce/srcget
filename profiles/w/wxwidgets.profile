# vim:syntax=sh

latest="firstaftermatchword"
srcurl="https://www.wxwidgets.org/downloads/"
extension_input="tar.bz2"
sep='"'
opt_match="Latest Stable Release:"
version_holder="#version#"
#https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.4/wxWidgets-3.0.4.tar.bz2
custom_url="https://github.com/wxWidgets/wxWidgets/releases/download/v#version#/wxWidgets-#version#.${extension_input}"
basename="wxWidgets"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
