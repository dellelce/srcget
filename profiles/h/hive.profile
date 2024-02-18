# vim:syntax=sh

basename="hive"
latest="hive"
srcurl="https://hive.apache.org/general/downloads/"
comment=""
extension_input="tar.gz"
#baseurl="http://mirror.ox.ac.uk/sites/rsync.apache.org/hive/hive-"
#https://dlcdn.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-src.tar.gz
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
custom_url="https://dlcdn.apache.org/hive/hive-#version#/apache-hive-#version#-src.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
