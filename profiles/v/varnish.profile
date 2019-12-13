# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="is released"
srcurl="https://www.varnish-cache.org/releases"
#http://repo.varnish-cache.org/source/varnish-3.0.5.tar.gz
extension_input="tar.gz"
version_holder="#version#"
custom_url="https://varnish-cache.org/_downloads/varnish-#version#.tgz"
custom_file_prefix="varnish-"
custom_file_postfix=".${extension_input}"
