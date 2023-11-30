# vim:syntax=sh

latest="github"
baseurl="https://github.com/dstndstn/astrometry.net"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
basename="astrometry.net"
# https://github.com/dstndstn/astrometry.net/archive/refs/tags/0.94.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
sep='"'
