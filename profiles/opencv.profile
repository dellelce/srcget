# vim:syntax=sh

filter="awk/opencvvers.awk"
baseurl="https://github.com/itseez/opencv"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
#https://github.com/twitter/twemcache/archive/v2.6.0.tar.gz
custom_url_prefix="${baseurl}/archive/"
basename="opencv"
custom_file_prefix="${basename}-"
