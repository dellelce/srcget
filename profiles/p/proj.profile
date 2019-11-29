# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="Release Notes"
#opt_nonmatch="md5"
srcurl="https://proj.org/news.html"
comment="software that transforms geospatial coordinates from one coordinate reference system (CRS) to another"
extension_input="tar.gz"
basename="proj"
version_holder="#version#"
#https://download.osgeo.org/proj/proj-6.1.1.tar.gz
custom_url="http://download.osgeo.org/proj/proj-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
