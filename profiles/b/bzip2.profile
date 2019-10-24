# vim:syntax=sh

latest="firstaftermatchword"
srcurl="https://www.sourceware.org/bzip2/downloads.html"
comment="Compression program that uses the Burrows–Wheeler algorithm"
opt_match="The current stable version"
extension_input="tar.gz"
basename="bzip2"
version_holder="#version#"
#https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz
custom_url="https://sourceware.org/pub/bzip2/bzip2-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
