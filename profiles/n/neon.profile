# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://notroj.github.io/neon/"
opt_match="in release"
opt_nonmatch=""
basename="neon"
extension_input="tar.gz"
comment="an HTTP/1.1 and WebDAV client library, with a C interface."
version_holder="#version#"
custom_url="https://notroj.github.io/neon/neon-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
