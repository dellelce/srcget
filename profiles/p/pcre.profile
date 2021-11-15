# vim:syntax=sh

latest="firstaftermatchword-trim"
baseurl="https://github.com/PhilipHazel/pcre2"
srcurl="${baseurl}"
extension_input="tar.gz"
custom_url_prefix="${baseurl}/archive/"
basename="pcre2"
opt_match="css-truncate css-truncate-target text-bold mr-2"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
