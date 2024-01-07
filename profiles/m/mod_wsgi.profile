# vim:syntax=sh

basename="mod_wsgi"
latest="github"
baseurl="https://github.com/GrahamDumpleton/mod_wsgi"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
