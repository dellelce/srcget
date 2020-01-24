# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.openldap.org/software/download/"
opt_match="Our latest release"
opt_nonmatch=""
basename="openldap"
extension_input="tgz"
extension_output="tar.gz"
comment=""
version_holder="#version#"
custom_url="ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_output}"
