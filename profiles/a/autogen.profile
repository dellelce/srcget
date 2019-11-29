# vim:syntax=sh

latest="autogen"
srcurl="https://ftp.gnu.org/gnu/autogen/"
extension_input="tar.xz"
version_holder="#version#"
basename="autogen"
custom_url="${srcurl}/rel#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

