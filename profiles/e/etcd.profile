# vim:syntax=sh

latest="firstaftermatchword-trim"
baseurl="https://github.com/etcd-io/etcd"
srcurl="${baseurl}"
extension_input="tar.gz"
custom_url_prefix="${baseurl}/archive/"
basename="etcd"
opt_match="css-truncate css-truncate-target text-bold mr-2"
version_holder="#version#"
custom_url="https://github.com/etcd-io/etcd/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
