# vim:syntax=sh

latest="github"
basename="yarn"
baseurl="https://github.com/yarnpkg/yarn"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
# https://github.com/yarnpkg/yarn/archive/refs/tags/v1.22.19.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/v"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
