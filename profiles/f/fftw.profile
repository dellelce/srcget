# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.fftw.org/"
opt_match="The latest official release of"
opt_nonmatch=""
basename="fftw"
extension_input="tar.gz"
comment=""
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
custom_url="http://www.fftw.org/fftw-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"