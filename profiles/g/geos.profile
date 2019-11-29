# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="Download"
srcurl="http://trac.osgeo.org/geos/"
comment="Geometry Engine, Open Source"
extension_input="tar.bz2"
basename="geos"
version_holder="#version#"
#http://download.osgeo.org/geos/geos-3.7.2.tar.bz2
custom_url="http://download.osgeo.org/geos/geos-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
