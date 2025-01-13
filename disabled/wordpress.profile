# vim:syntax=sh

basename="wordpress"
latest="firstaftermatchword"
extension_input="tar.gz"
opt_match="${extension_input}"
srcurl="https://wordpress.org/download/releases/"
version_holder="#version#"

#https://wordpress.org/wordpress-6.4.2.tar.gz
custom_url="https://wordpress.org/wordpress-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
