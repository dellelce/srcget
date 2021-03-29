# vim:syntax=sh

latest="cgal"
srcurl="https://www.cgal.org/releases.html"
extension_input="tar.xz"
sep='"'
version_holder="#version#"
baseurl="https://github.com/CGAL/cgal"
basename="CGAL"
custom_url="${baseurl}/releases/download/v#version#/CGAL-#version#.${extension_input}"
custom_file_postfix=".${extension_input}"
custom_file_prefix="${basename}-"

## EOF ##
