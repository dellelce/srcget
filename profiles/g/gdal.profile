# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="#current-releases"
#opt_match="Latest Stable Release"
#srcurl="http://trac.osgeo.org/gdal/wiki/DownloadSource"
srcurl="https://gdal.org/download.html"
comment="Translator library for raster and vector geospatial data formats"
extension_input="tar.xz"
basename="gdal"
version_holder="#version#"
#http://download.osgeo.org/gdal/3.0.1/gdal-3.0.1.tar.xz
custom_url="http://download.osgeo.org/gdal/#version#/gdal-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
