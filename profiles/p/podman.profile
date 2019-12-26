# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://podman.io/releases/"
opt_match="Released"
opt_nonmatch=""
basename="podman"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://github.com/containers/libpod/archive/v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
