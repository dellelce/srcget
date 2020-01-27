# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.nasm.us/"
opt_match="Stable"
opt_nonmatch=""
basename="nasm"
extension_input="tar.xz"
comment=""
version_holder="#version#"
custom_url="https://www.nasm.us/pub/nasm/releasebuilds/#version#/nasm-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
