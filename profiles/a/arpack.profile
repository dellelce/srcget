# vim:syntax=sh

basename="arpack"
latest="github"
baseurl="https://github.com/opencollab/arpack-ng"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment="Collection of Fortran77 subroutines designed to solve large scale eigenvalue problems"
