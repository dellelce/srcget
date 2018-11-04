# vim:syntax=sh

pkgprofile="gcc-6"
latest="gcc-gnu"
srcurl="http://ftp.gnu.org/gnu/gcc"
extension_input="tar.xz"
version_holder="#version#"
basename="gcc"
custom_url="${srcurl}/${basename}-#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

