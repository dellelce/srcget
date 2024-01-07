# vim:syntax=sh

basename="rpm"
latest="github"
baseurl="https://github.com/rpm-software-management/rpm"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#-release.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
