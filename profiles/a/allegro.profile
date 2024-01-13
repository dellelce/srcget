# vim:syntax=sh

basename="allegro"
latest="github"
baseurl="https://github.com/liballeg/allegro5"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
