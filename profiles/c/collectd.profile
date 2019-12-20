# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://collectd.org/download.shtml"
opt_match="Download"
opt_nonmatch="min.js"
basename="collectd"
extension_input="tar.bz2"
comment=""
version_holder="#version#"
custom_url="https://storage.googleapis.com/collectd-tarballs/collectd-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
