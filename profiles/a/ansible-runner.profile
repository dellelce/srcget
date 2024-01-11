# vim:syntax=sh

basename="ansible-runner"
latest="github"
baseurl="https://github.com/ansible/ansible-runner"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
