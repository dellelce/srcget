# vim:syntax=sh

latest="gnu"
basename="inetutils"
srcurl="http://ftp.gnu.org/gnu/inetutils/"
extension_input="tar.xz"
version_holder="#version#"
#http://ftp.gnu.org/gnu/inetutils/inetutils-2.6.tar.xz
custom_url="http://ftp.gnu.org/gnu/inetutils/inetutils-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
