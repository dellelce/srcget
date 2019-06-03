# vim:syntax=sh

latest="bind"
srcurl="http://www.isc.org/downloads/"
baseurl="${srcurl}"
comment=""
extension_input="tar.gz"
sep='"'
basename="bind"
# https://www.isc.org/downloads/file/bind-9-10-4-p1/?version=tar-gz
#https://downloads.isc.org/isc/bind9/9.15.0/bind-9.15.0.tar.gz
#https://downloads.isc.org/isc/bind9/bind9.15.0.tar.gz/bind-bind9.15.0.tar.gz.tar.gz`:"
version_holder="#version#"
custom_url="https://downloads.isc.org/isc/bind9/#version#/bind-#version#.${extension_input}"

custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
