# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="flutter"
srcurl="https://storage.googleapis.com/flutter_infra/releases/releases_linux.json"
opt_matchword="stable"
extension_input="tar.gz"
version_holder="#version#"
custom_url="https://github.com/flutter/flutter/archive/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment="UI toolkit for building mobile, web & desktop application"

## EOF ##
