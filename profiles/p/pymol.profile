# vim:syntax=sh

basename="pymol"
latest="github"
baseurl="https://github.com/schrodinger/pymol-open-source"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
