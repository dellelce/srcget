# vim:syntax=sh

basename="yash"
latest="github"
baseurl="https://github.com/magicant/yash"
srcurl="${baseurl}/releases"
extension_input="tar.xz"
version_holder="#version#"
#https://github.com/magicant/yash/releases/download/2.58.1/yash-2.58.1.tar.xz
custom_url="${baseurl}/releases/download/#version#//yash-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
