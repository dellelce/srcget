# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.wireshark.org/download.html"
extension_input="tar.xz"
opt_match="The current stable release of Wireshark"
version_holder="#version#"
basename="wireshark"
custom_url="https://1.eu.dl.wireshark.org/src/wireshark-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
