# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.mpich.org/downloads/"
comment="Implementation of Messaging Passing Interface (MPI) standard"
opt_match="stable release"
extension_input="tar.gz"
basename="mpich"
version_holder="#version#"
#http://www.mpich.org/static/downloads/3.3.1/mpich-3.3.1.tar.gz
custom_url="http://www.mpich.org/static/downloads/#version#/mpich-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
