# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.netlib.org/blas/"
opt_match="REFERENCE BLAS Version"
opt_nonmatch=""
basename="blas"
extension_input="tgz"
extension_output="tar.gz"
comment=""
version_holder="#version#"
custom_url="http://www.netlib.org/blas/blas-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_output}"
