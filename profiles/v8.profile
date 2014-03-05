# vim:syntax=sh

filter="awk/v8vers.awk"
baseurl="https://github.com/v8/v8"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
custom_url_prefix="${baseurl}/archive/"
basename="v8"
custom_file_prefix="${basename}-"
