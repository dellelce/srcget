# vim:syntax=sh

basename="nmap"
latest="firstaftermatchword-trim"
srcurl="https://nmap.org/download.html"
extension_input="tar.bz2"
opt_match="Latest <u>stable</u> Nmap release tarball"
version_holder="#version#"
custom_url="https://nmap.org/dist/nmap-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
