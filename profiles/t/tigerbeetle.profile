# vim:syntax=sh

basename="tigerbeetle"
latest="github"
baseurl="https://github.com/tigerbeetle/tigerbeetle"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
