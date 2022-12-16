# vim:syntax=sh

latest="github"
basename="yosys"
baseurl="https://github.com/YosysHQ/yosys"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
custom_url_prefix="${baseurl}/archive/refs/tags/${basename}-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

