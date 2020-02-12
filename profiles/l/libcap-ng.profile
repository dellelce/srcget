# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://people.redhat.com/sgrubb/libcap-ng/"
opt_match="Latest Release is"
opt_nonmatch=""
basename="libcap-ng"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
