# vim:syntax=sh

filter="awk/rethinkdbvers.awk"
baseurl="https://github.com/rethinkdb/rethinkdb"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
custom_url_prefix="${baseurl}/archive/"
basename="rethinkdb"
custom_file_prefix="${basename}-"
