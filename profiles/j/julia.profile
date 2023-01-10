# vim:syntax=sh

latest="github"
basename="julia"
baseurl="https://github.com/JuliaLang/julia"
srcurl="${baseurl}"
extension_input="tar.gz"
sep='"'
#https://github.com/JuliaLang/julia/releases/download/v1.8.4/julia-1.8.4.tar.gz
version_holder="#version#"
custom_url="${baseurl}/releases/download/v#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
