# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="libslirp"
baseurl="https://gitlab.freedesktop.org/slirp/libslirp"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
opt_match="Download source code"
version_holder="#version#"
custom_url="${baseurl}/-/archive/v#version#/libslirp-v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
