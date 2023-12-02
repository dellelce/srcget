# vim:syntax=sh

latest="github"
basename="leatherman"
baseurl="https://github.com/puppetlabs/leatherman"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
#https://github.com/puppetlabs/leatherman/releases/download/1.12.9/leatherman.tar.gz
version_holder="#version#"
custom_url="${baseurl}/releases/download/#version#/leatherman.tar.gz"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
