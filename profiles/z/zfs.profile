# vim:syntax=sh

latest="github"
baseurl="https://github.com/openzfs/zfs"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
basename="zfs"
version_holder="#version#"
custom_url="${baseurl}/releases/download/${basename}-#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
