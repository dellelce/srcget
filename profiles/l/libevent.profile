# vim:syntax=sh

basename="libevent"
latest="github"
baseurl="https://github.com/libevent/libevent"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/releases/download/release-#version#-stable/libevent-#version#-stable.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
