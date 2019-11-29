# vim:syntax=sh

latest="firstaftermatchword"
srcurl="http://www.netlib.org/scalapack"
comment=""
opt_match="_scalapack_version_"
extension_input="tgz"
extension_output="tar.gz"
basename="scalapack"
version_holder="#version#"
custom_url="${srcurl}/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_output}"


## EOF ##
