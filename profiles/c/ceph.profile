# vim:syntax=sh

latest="generic-with-compare"
srcurl="http://download.ceph.com/tarballs"
extension_input="tar.gz"
sep='"'
version_holder="#version#"
basename="ceph"
opt_match="${basename}-"
custom_url="${srcurl}/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
