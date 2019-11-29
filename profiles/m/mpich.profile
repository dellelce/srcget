# vim:syntax=sh

latest="firstaftermatchword"
srcurl="https://www.mpich.org/"
comment="Implementation of Messaging Passing Interface (MPI) standard"
opt_match="released"
extension_input="tar.gz"
basename="mpich"
version_holder="#version#"
#http://www.mpich.org/static/downloads/3.3.1/mpich-3.3.1.tar.gz
custom_url="http://www.mpich.org/static/downloads/#version#/mpich-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
