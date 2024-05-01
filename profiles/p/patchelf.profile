# vim:syntax=sh

basename="patchelf"
latest="github"
baseurl="https://github.com/NixOS/patchelf"
srcurl="${baseurl}/releases"
extension_input="tar.bz2"
version_holder="#version#"
#https://github.com/NixOS/patchelf/releases/download/0.18.0/patchelf-0.18.0.tar.bz2
custom_url="${baseurl}//releases/download/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
