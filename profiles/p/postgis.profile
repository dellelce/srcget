# vim:syntax=sh

basename="postgis"
latest="firstaftermatchword-trim"
opt_match="PostGIS Patch Releases"
srcurl="https://postgis.net/"
baseurl="https://download.osgeo.org/postgis/source"
comment=""
extension_input="tar.gz"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
custom_url_prefix="${baseurl}/postgis-"
custom_url_postfix=".${extension_input}"
