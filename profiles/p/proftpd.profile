# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.proftpd.org/"
extension_input="tar.gz"
sep='"'
opt_match="Stable"
version_holder="#version#"
basename="proftpd"
custom_url="ftp://ftp.proftpd.org/distrib/source/proftpd-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
