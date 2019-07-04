# vim:syntax=sh

latest="firstaftermatchword"
srcurl="http://glew.sourceforge.net"
extension_input="tar.gz"
sep='"'
#https://sourceforge.net/projects/glew/files/glew/2.1.0/glew-2.1.0.tgz/download
opt_match="The latest release is"
version_holder="#version#"
custom_url="https://sourceforge.net/projects/glew/files/glew/#version#/glew-#version#.tgz/download"
basename="glew"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
