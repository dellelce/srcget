# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://electrum.org/#download"
opt_match="Latest release"
opt_nonmatch=""
basename="electrum"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://download.electrum.org/#version#/Electrum-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
