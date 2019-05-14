# vim:syntax=sh

latest="cgal"
srcurl="https://www.cgal.org/releases.html"
extension_input="tar.xz"
sep='"'
#https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-4.14/CGAL-4.14.tar.xz
version_holder="#version#"
baseurl="https://github.com/CGAL/cgal/releases/download"
basename="CGAL"
custom_url="${baseurl}/releases%2FCGAL-#version#/CGAL-#version#.${extension_input}"
custom_file_postfix=".${extension_input}"
custom_file_prefix="${basename}-"

## EOF ##
