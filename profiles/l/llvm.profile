# vim:syntax=sh

basename="llvm"
latest="github"
baseurl="https://github.com/llvm/llvm-project"
srcurl="${baseurl}/tags"
extension_input="tar.gz"
version_holder="#version#"
custom_url="${baseurl}/archive/refs/tags/llvmorg-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
