# vim:syntax=sh

latest="github"
basename="traefik"
baseurl="https://github.com/traefik/traefik"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
version_holder="#version#"
custom_url="${srcurl}/download/v#version#/${basename}-v#version#.src.${extension_input}"
custom_url_prefix="${baseurl}/archive/"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
