# vim:syntax=sh

basename="ghc"
latest="github"
baseurl="https://github.com/ghc/ghc"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/ghc/ghc/archive/refs/tags/ghc-9.4.8-release.tar.gz
custom_url="${baseurl}/archive/refs/tags/${basename}-#version#-release.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
