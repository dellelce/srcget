# vim:syntax=sh

latest="github"
basename="curl"
baseurl="https://github.com/curl/curl"
srcurl="${baseurl}/releases"
extension_input="tar.bz2"
sep='"'
#https://github.com/curl/curl/releases/download/curl-8_4_0/curl-8.4.0.tar.bz2
version_holder="#version#"
uscore_version_holder="#uversion#"
custom_url="${baseurl}/releases/download/curl-#uversion#/curl-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
