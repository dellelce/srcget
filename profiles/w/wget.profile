# vim:syntax=sh

latest="gnu"
basename="wget"
srcurl="http://ftp.gnu.org/gnu/wget/"
opt_nonmatch="wget2"
extension_input="tar.xz"
version_holder="#version#"
custom_url="http://ftp.gnu.org/gnu/wget/wget-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
