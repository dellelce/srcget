# vim:syntax=sh

basename="v8"
latest="github"
baseurl="https://github.com/v8/v8"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/v8/v8/releases/tag/12.2.111
#https://github.com/v8/v8/archive/refs/tags/12.2.111.tar.gZ
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
