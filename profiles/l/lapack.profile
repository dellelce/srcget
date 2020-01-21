# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.netlib.org/lapack/"
opt_match="LAPACK, version"
opt_nonmatch=""
basename="lapack"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://github.com/Reference-LAPACK/lapack/archive/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
