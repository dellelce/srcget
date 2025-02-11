# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="astyle"
baseurl="https://gitlab.com/saalen/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="tag-icon"
version_holder="#version#"
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
