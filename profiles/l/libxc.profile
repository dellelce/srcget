# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.tddft.org/programs/libxc/download/"
comment=""
opt_match="latest stable release"
extension_input="tar.gz"
basename="libxc"
version_holder="#version#"
custom_url="http://www.tddft.org/programs/libxc/down.php?file=#version#/libxc-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
