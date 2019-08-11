# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="Latest release"
srcurl="https://www.openjpeg.org"
comment="An open-source JPEG 2000 codec written in C"
extension_input="tar.gz"
basename="openjpeg"
version_holder="#version#"
#https://github.com/uclouvain/openjpeg/archive/v2.3.1.tar.gz
custom_url="https://github.com/uclouvain/openjpeg/archive/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
