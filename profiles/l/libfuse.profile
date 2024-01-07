# vim:syntax=sh

basename="libfuse"
latest="github"
baseurl="https://github.com/libfuse/libfuse"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/fuse-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
