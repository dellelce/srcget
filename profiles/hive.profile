# vim:syntax=sh

filter="awk/hivevers.awk"
srcurl="http://hive.apache.org/downloads.html"
baseurl="http://mirror.ox.ac.uk/sites/rsync.apache.org/hive/hive-"
comment=""
extension_input="tar.gz"
basename="hive"
custom_url_prefix="${baseurl}"
custom_url_postfix=".${extension_input}"
#custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
