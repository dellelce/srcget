# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="gnutls"
baseurl="https://gitlab.com/gnutls/gnutls"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="tag-icon"
version_holder="#version#"
#https://gitlab.com/gnutls/gnutls/-/archive/gnutls_3_6_8/gnutls-gnutls_3_6_8.tar.bz2
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
