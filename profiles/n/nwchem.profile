# vim:syntax=sh

basename="nwchem"
latest="github"
baseurl="https://github.com/nwchemgit/nwchem"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/v#version#-release.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
