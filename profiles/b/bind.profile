# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.isc.org/download/"
opt_match="New Stable"
opt_nonmatch="ARM"
basename="bind9"
extension_input="tar.xz"
comment=""
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
custom_url="https://downloads.isc.org/isc/bind9/#version#/bind-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
