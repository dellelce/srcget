# vim:syntax=sh

filter="awk/varnish.latest.awk"
srcurl="https://www.varnish-cache.org/releases"
#http://repo.varnish-cache.org/source/varnish-3.0.5.tar.gz
extension_input="tar.gz"
custom_url_prefix="http://repo.varnish-cache.org/source/varnish-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="varnish-"
custom_file_postfix="${custom_url_postfix}"
