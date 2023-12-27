# vim:syntax=sh

basename="syslog-ng"
latest="github"
baseurl="https://github.com/syslog-ng/syslog-ng"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
