# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.simplesystems.org/libtiff/"
opt_match="Latest Stable Release"
opt_nonmatch=""
basename="libtiff"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://download.osgeo.org/libtiff/tiff-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
