# vim:syntax=sh

latest="github"
baseurl="https://github.com/git/git"
srcurl="${baseurl}/tags"
comment="that's git!"
extension_input="tar.gz"
sep='"'
basename="git"
#https://github.com/git/git/archive/refs/tags/v2.38.1.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
