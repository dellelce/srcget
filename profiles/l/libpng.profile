# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="libpng"
srcurl="http://www.libpng.org/pub/png/libpng.html"
opt_match="The current public release"
extension_input="tar.xz"
#
version_holder="#version#"
custom_url="http://prdownloads.sourceforge.net/libpng/libpng-#version#.${extension_input}?download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
