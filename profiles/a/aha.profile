# vim:syntax=sh

basename="aha"
latest="github"
baseurl="https://github.com/theZiz/aha"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment="Converts ANSI escape sequences of a unix terminal to HTML code"
