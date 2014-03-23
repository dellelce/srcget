# vim:syntax=sh

filter="awk/quickfixvers.awk"
baseurl="https://github.com/quickfix/quickfix"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
custom_url_prefix="${baseurl}/archive/v"
custom_url_postfix=".${extension_input}"
basename="quickfix"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
