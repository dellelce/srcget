# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://go.dev/dl/"
opt_match="tar.gz"
opt_nonmatch=""
basename="go"
extension_input="tar.gz"
comment=""
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
# https://go.dev/dl/go1.21.5.src.tar.gz
custom_url="https://go.dev/dl/#version#.src.${extension_input}"
custom_file_prefix="${basename}"
custom_file_postfix=".${extension_input}"
