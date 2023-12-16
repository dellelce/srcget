# vim:syntax=sh

basename="godot"
latest="github"
baseurl="https://github.com/godotengine/godot"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/godotengine/godot/archive/refs/tags/4.2.1-stable.tar.gz
custom_url="${baseurl}/archive/refs/tags/#version#-stable.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
