# vim:syntax=sh

basename="xz"
latest="github"
baseurl="https://github.com/tukaani-project/xz"
srcurl="${baseurl}/releases"
extension_input="tar.bz2"
version_holder="#version#"
custom_url="${baseurl}/releases/download/v#version#/xz-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
