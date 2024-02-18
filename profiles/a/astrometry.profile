# vim:syntax=sh

basename="astrometry"
latest="github"
baseurl="https://github.com/dstndstn/astrometry.net"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/dstndstn/astrometry.net/releases/download/0.94/astrometry.net-0.94.tar.gz
custom_url="${baseurl}/releases/download/#version#/astrometry.net-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
