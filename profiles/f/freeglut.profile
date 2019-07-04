# vim:syntax=sh

basename="freeglut"
latest="firstaftermatchword-trim"
srcurl="https://sourceforge.net/projects/${basename}/files/"
extension_input="tar.gz"
sep='"'
opt_match="Latest Version"
version_holder="#version#"
custom_url="https://sourceforge.net/projects/${basename}/files/${basename}/#version#/${basename}-#version#.${extension_input}/download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
