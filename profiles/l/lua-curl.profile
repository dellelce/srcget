# vim:syntax=sh

basename="lua-curl"
latest="github"
baseurl="https://github.com/Lua-cURL/Lua-cURLv3"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
