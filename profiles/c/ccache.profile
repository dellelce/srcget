# vim:syntax=sh

latest="firstaftermatchword"
srcurl="https://ccache.dev/"
comment="a fast C/C++ compiler cache"
opt_match="has been released"
extension_input="tar.xz"
basename="ccache"
version_holder="#version#"
#https://github.com/ccache/ccache/releases/download/v3.7.5/ccache-3.7.5.tar.xz
custom_url="https://github.com/ccache/ccache/releases/download/v#version#/ccache-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
