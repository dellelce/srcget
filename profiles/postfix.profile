# vim:syntax=sh

filter="awk/postfix.latest.awk"
srcurl="http://www.postfix.org/announcements.html"
#http://mirror.tje.me.uk/pub/mirrors/postfix-release/official/postfix-2.11.1.tar.gz
baseurl="http://mirror.tje.me.uk/pub/mirrors/postfix-release/official/postfix-"
comment=""
extension_input="tar.gz"
sep='"'
basename="postfix"
custom_url_prefix="${baseurl}"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix="${custom_url_postfix}"

## EOF ##
