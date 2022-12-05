# vim:syntax=sh

latest="github"
baseurl="https://github.com/redis/redis"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
custom_url_prefix="${baseurl}/archive/"
custom_url_postfix=".${extension_input}"
basename="redis"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
