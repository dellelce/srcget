# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="logwatch"
srcurl="https://sourceforge.net/projects/logwatch/files/"
opt_match="Download Latest Version"
extension_input="tar.gz"
#https://sourceforge.net/projects/logwatch/files/logwatch-7.5.2/logwatch-7.5.2.tar.gz/download
version_holder="#version#"
custom_url="https://sourceforge.net/projects/logwatch/files/logwatch-#version#/logwatch-#version#.${extension_input}/download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
