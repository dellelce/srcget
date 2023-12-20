# vim:syntax=sh

basename="aria2"
latest="github"
baseurl="https://github.com/aria2/aria2"
srcurl="${baseurl}/releases"
extension_input="tar.bz2"
version_holder="#version#"
#https://github.com/aria2/aria2/releases/download/release-1.37.0/aria2-1.37.0.tar.bz2
custom_url="${baseurl}/releases/download/release-#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
