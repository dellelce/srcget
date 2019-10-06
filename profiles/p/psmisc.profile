# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="psmisc"
baseurl="https://gitlab.com/${basename}/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="Download source code"
version_holder="#version#"
custom_url="${baseurl}/-/archive/v#version#/${basename}-v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
