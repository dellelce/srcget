# vim:syntax=sh

latest="gnu"
basename="binutils"
srcurl="http://ftp.gnu.org/gnu/binutils/"
extension_input="tar.gz"
version_holder="#version#"
custom_url="http://ftp.gnu.org/gnu/binutils/binutils-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
