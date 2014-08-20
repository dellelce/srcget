# vim:syntax=sh

filter="awk/logwatch.latest.awk"
srcurl="http://sourceforge.net/projects/logwatch/files/"
extension_input="tar.gz"
# if set will be used to generate url
sep='/'
comment="very out of date and no other official website found"
#http://downloads.sourceforge.net/project/logwatch/logwatch-7.4.0/logwatch-7.4.0.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Flogwatch%2Ffiles%2F&ts=1393781307&use_mirror=netcologne
custom_url_prefix="http://downloads.sourceforge.net/project/logwatch/logwatch-"
custom_url_postfix=".${extension_input}"
custom_file_postfix=".${extension_input}"

