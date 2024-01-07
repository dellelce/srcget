# vim:syntax=sh

basename="libpcap"
latest="github"
baseurl="https://github.com/the-tcpdump-group/libpcap"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
