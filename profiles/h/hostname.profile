# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://packages.debian.org/source/stable/hostname"
extension_input="tar.gz"
opt_match="Source Package"
version_holder="#version#"
basename="hostname"
custom_url="http://deb.debian.org/debian/pool/main/h/hostname/hostname_#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
