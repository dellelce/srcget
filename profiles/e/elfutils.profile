# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://sourceware.org/elfutils/"
comment=""
opt_match="Last release:"
extension_input="tar.bz2"
basename="elfutils"
version_holder="#version#"
#https://sourceware.org/elfutils/ftp/0.185/elfutils-0.185.tar.bz2
custom_url="https://sourceware.org/elfutils/ftp/#version#/elfutils-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
