# vim:syntax=sh

basename="zaproxy"
latest="firstaftermatchword-trim"
opt_match="the ZAP downloads are maintained on the"
srcurl="https://www.zaproxy.org/download/"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/zaproxy/zaproxy/archive/refs/tags/v2.14.0.tar.gz
custom_url="https://github.com/zaproxy/zaproxy/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
