# vim:syntax=sh

basename="psi4"
latest="github"
baseurl="https://github.com/psi4/psi4"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/psi4/psi4/archive/refs/tags/v1.9.1.tar.gz
custom_url="${baseurl}/archive/refs/tags/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
