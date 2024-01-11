# vim:syntax=sh

basename="codeql"
latest="github"
baseurl="https://github.com/github/codeql"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/codeql-cli/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
