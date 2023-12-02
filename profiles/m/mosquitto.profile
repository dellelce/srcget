# vim:syntax=sh

latest="github"
basename="mosquitto"
baseurl="https://github.com/eclipse/mosquitto"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
custom_url_prefix="${baseurl}/archive/refs/tags/v"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
