# vim:syntax=sh

basename="ninja"
latest="firstaftermatchword-trim"
srcurl="https://ninja-build.org/"
extension_input="tar.gz"
sep='"'
opt_match="The last Ninja release is"
version_holder="#version#"
custom_url="https://github.com/ninja-build/ninja/archive/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
