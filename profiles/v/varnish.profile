# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="is released"
opt_nonmatch=".html#"
srcurl="https://www.varnish-cache.org/releases"
#http://repo.varnish-cache.org/source/varnish-3.0.5.tar.gz
extension_input="tgz"
extension_output="tar.gz"
version_holder="#version#"
custom_url="https://varnish-cache.org/_downloads/varnish-#version#.${extension_input}"
custom_file_prefix="varnish-"
custom_file_postfix=".${extension_output}"
