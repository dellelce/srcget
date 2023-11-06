# vim:syntax=sh

latest="github"
basename="curl"
baseurl="https://github.com/curl/curl"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
#https://github.com/curl/curl/archive/refs/tags/curl-8_4_0.tar.gz
underscorevers="please"
version_holder="#version#"
custom_url_prefix="${baseurl}/archive/refs/tags/curl-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
