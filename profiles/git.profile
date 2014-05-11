# vim:syntax=sh

filter="awk/gitvers.awk"
srcurl="https://code.google.com/p/git-core/downloads/list"
extension_input="tar.gz"
custom_url_prefix="https://git-core.googlecode.com/files/git-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="git-"
custom_file_postfix=".${extension_input}"
sep="'"
