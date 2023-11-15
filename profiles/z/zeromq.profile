# vim:syntax=sh

basename="zeromq"
latest="github"
baseurl="https://github.com/zeromq/libzmq"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
version_holder="#version#"
custom_url="${baseurl}/releases/download/v#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
