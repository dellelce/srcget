# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://sourceware.org/libffi/"
opt_match="was released"
extension_input="tar.gz"
basename="libffi"
comment=""
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
custom_url="https://github.com/libffi/libffi/releases/download/v#version#/libffi-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
