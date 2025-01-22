# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="libxc"
baseurl="https://gitlab.com/libxc/libxc"
srcurl="https://libxc.gitlab.io/download/"
extension_input="tar.bz2"
sep='"'
opt_match="downloaded here"
version_holder="#version#"
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
