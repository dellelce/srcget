# vim:syntax=sh

latest="hive"
srcurl="http://hive.apache.org/downloads.html"
baseurl="http://mirror.ox.ac.uk/sites/rsync.apache.org/hive/hive-"
comment=""
extension_input="tar.gz"
basename="hive"
custom_url_prefix="${baseurl}"
#http://mirror.ox.ac.uk/sites/rsync.apache.org/hive/hive-0.13.0/apache-hive-0.13.0-src.tar.gz
custom_url_postfix="-src.${extension_input}"
#custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
