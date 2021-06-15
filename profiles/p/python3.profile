# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="latest source release"
srcurl="https://www.python.org/downloads/"
extension_input="tar.xz"
basename="Python"
sep='"'
version_holder="#version#"
custom_url="https://www.python.org/ftp/python/#version#/Python-#version#.${extension_input}"
custom_file_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
