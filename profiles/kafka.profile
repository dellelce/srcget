# vim:syntax=sh

latest="kafka"
srcurl="https://kafka.apache.org/downloads"
comment=""
basename="kafka"
extension_input="tgz"
baseurl="http://www.mirrorservice.org/sites/ftp.apache.org/kafka"
version_holder="#version#"
custom_url="${baseurl}/#version#/${basename}-#version#-src.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
