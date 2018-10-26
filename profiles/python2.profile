# vim:syntax=sh

latest="python2"
srcurl="https://www.python.org/downloads/"
extension_input="tar.xz"
# https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tar.xz
basename="Python"
version_holder="#version#"
custom_url="https://www.python.org/ftp/python/#version#/${basename}-#version#.${extension_input}"

sep='"'
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
