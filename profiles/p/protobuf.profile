# vim:syntax=sh

basename="protobuf"
latest="github"
baseurl="https://github.com/protocolbuffers/protobuf"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/releases/download/v#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
