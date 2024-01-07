# vim:syntax=sh

basename="bbolt"
latest="github"
baseurl="https://github.com/etcd-io/bbolt"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
