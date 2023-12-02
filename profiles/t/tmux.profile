# vim:syntax=sh

latest="github"
basename="tmux"
baseurl="https://github.com/tmux/tmux"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/releases/download/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
