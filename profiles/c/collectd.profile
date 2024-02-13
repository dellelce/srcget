# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.collectd.org/download.html"
opt_match="tar.bz2"
opt_nonmatch="rc"
basename="collectd"
extension_input="tar.bz2"
comment=""
version_holder="#version#"
custom_url="https://storage.googleapis.com/collectd-tarballs/collectd-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
