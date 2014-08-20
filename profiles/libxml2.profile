# vim:syntax=sh

filter="awk/libxml2.latest.awk"
srcurl="http://www.xmlsoft.org/news.html"
baseurl=""
extension="tar.gz"
# if set will be used to generate url
#ftp://xmlsoft.org/libxml2/libxml2-2.9.1.tar.gz
custom_url_prefix="ftp://xmlsoft.org/libxml2/libxml2-"
custom_url_postfix=".${extension}"
custom_file_prefix="libxml2-"
custom_file_postfix=".${extension}"
