# vim:syntax=sh

basename="bun"
latest="github"
baseurl="https://github.com/oven-sh/bun"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/oven-sh/bun/archive/refs/tags/bun-v1.0.18.tar.gz
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
