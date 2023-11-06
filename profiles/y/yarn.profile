# vim:syntax=sh

latest="github"
baseurl="https://github.com/yarnpkg/yarn"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
# https://github.com/yarnpkg/yarn/releases/tag/v1.22.19
# https://github.com/yarnpkg/yarn/archive/refs/tags/v1.22.19.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/v"
custom_url_postfix=".${extension_input}"
basename="yarn"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
