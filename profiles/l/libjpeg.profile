# vim:syntax=sh

latest="firstaftermatchword-single"
srcurl="http://libjpeg.sourceforge.net"
extension_input="tar.gz"
sep='"'
opt_match="release is version"
version_holder="#version#"
#https://sourceforge.net/projects/libjpeg/files/libjpeg/6b/jpegsrc.v6b.tar.gz/download
custom_url="https://sourceforge.net/projects/libjpeg/files/libjpeg/#version#/jpegsrc.v#version#.${extension_input}/download"
basename="libjpeg"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
