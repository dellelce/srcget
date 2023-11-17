# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://sebastien.godard.pagesperso-orange.fr/download.html"
opt_match="sysstat version is"
opt_nonmatch=""
basename="sysstat"
extension_input="tar.gz"
comment=""
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
custom_url="http://pagesperso-orange.fr/sebastien.godard/sysstat-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"