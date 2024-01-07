# vim:syntax=sh

basename="gperftools"
latest="github"
baseurl="https://github.com/gperftools/gperftools"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-2.15.tar.gz
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
