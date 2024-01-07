# vim:syntax=sh

basename="cpp-hocon"
latest="github"
baseurl="https://github.com/puppetlabs/cpp-hocon"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
