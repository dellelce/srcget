# vim:syntax=sh

basename="tcpdump"
latest="firstaftermatchword"
srcurl="http://www.tcpdump.org/"
extension_input="tar.gz"
sep='"'
#srcurl="http://www.tcpdump.org/release/tcpdump-4.9.2.tar.gz"
opt_match="Latest Releases"
version_holder="#version#"
custom_url="http://www.tcpdump.org/release/tcpdump-#version#.tar.gz"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
