# vim:syntax=sh

filter="awk/exim.latest.awk"
#http://mirror.switch.ch/ftp/mirror/exim/exim/exim4/exim-4.82.tar.bz2
srcurl="http://www.exim.org/"
baseurl="http://mirror.switch.ch"
comment=""
extension_input="tar.bz2"
basename="exim"
custom_url_prefix="${baseurl}/ftp/mirror/exim/exim/exim4/exim-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
