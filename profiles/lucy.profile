# vim:syntax=sh

latest="awk/lucy.latest.awk"
srcurl="http://lucy.apache.org/download.html"
#http://apache.mirror.anlx.net/lucy/apache-lucy-0.3.3.tar.gz
baseurl="http://www.mirrorservice.org/sites/ftp.apache.org/lucy/"
comment=""
extension_input="tar.gz"
basename="apache-lucy"
custom_url_prefix="${baseurl}${basename}-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
