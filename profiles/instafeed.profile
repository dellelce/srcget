# vim:syntax=sh

filter="awk/instafeedvers.awk"
baseurl="https://github.com/stevenschobert/instafeed.js"
srcurl="${baseurl}/releases"
comment=""
extension_input="tar.gz"
sep='"'
basename="instafeed"
##https://github.com/stevenschobert/instafeed.js/archive/v1.3.0.tar.gz
#https://github.com/stevenschobert/instafeed.js/archive/vv1.3.0.tar.gz.tar.gz
custom_url_prefix="${baseurl}/archive/"
custom_file_prefix="${basename}-"

## EOF ##
