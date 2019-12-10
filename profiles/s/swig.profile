# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="swig"
srcurl="http://www.swig.org/download.html"
opt_match="The latest release"
extension_input="tar.gz"
# http://prdownloads.sourceforge.net/swig/swig-4.0.1.tar.gz
version_holder="#version#"
custom_url="http://prdownloads.sourceforge.net/swig/swig-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
