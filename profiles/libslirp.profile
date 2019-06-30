# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://gitlab.freedesktop.org/slirp/libslirp/-/tags"
extension_input="tar.bz2"
sep='"'
#https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v4.0.0/libslirp-v4.0.0.tar.bz2
opt_matrch="Download source code"
version_holder="#version#"
custom_url="https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v#version#/libslirp-v#version#.${extension_input}"
basename="libslrip"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
