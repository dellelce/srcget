# vim:syntax=sh

latest="awk/networkx.latest.awk"
srcurl="http://networkx.github.io/"
baseurl="https://pypi.python.org/packages/source/n/networkx/"
comment=""
extension_input="tar.gz"
basename="networkx"
#https://pypi.python.org/packages/source/n/networkx/networkx-1.8.1.tar.gz
custom_url_prefix="${baseurl}${basename}-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
