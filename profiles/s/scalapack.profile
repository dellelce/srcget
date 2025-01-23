# vim:syntax=sh

latest="firstaftermatchword"
srcurl="http://www.netlib.org/scalapack"
comment=""
opt_match="_scalapack_version_"
extension_input="tgz"
extension_output="tar.gz"
basename="scalapack"
version_holder="#version#"
#https://github.com/Reference-ScaLAPACK/scalapack/archive/refs/tags/v2.2.2.tar.gz
custom_url="https://github.com/Reference-ScaLAPACK/scalapack/archive/refs/tags/v#version#.${extension_output}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_output}"


## EOF ##
