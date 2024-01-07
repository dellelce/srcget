# vim:syntax=sh

basename="rabbitmq"
latest="github"
baseurl="https://github.com/rabbitmq/rabbitmq-server"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
