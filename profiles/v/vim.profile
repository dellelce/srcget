# vim:syntax=sh

latest="githubjson-tags"
path="vim/vim"
basename="vim"
baseurl="https://github.com/${path}"
srcurl="https://api.github.com/repos/${path}/tags"
extension_input="tar.gz"
custom_url_prefix="${baseurl}/archive/v"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
