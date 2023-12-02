# vim:syntax=sh

latest="github"
basename="zstd"
baseurl="https://github.com/facebook/zstd"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
custom_url_prefix="${baseurl}/archive/refs/tags/v"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
