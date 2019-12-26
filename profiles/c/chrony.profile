# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://chrony.tuxfamily.org/download.html"
opt_match="Latest stable release"
opt_nonmatch=""
basename="chrony"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://download.tuxfamily.org/chrony/chrony-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
