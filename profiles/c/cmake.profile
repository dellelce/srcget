# vim:syntax=sh

basename="cmake"
latest="firstaftermatchword-trim"
opt_match="Latest Release"
srcurl="https://cmake.org/download/"
baseurl=""
extension_input="tar.gz"
#https://github.com/Kitware/CMake/releases/download/v3.27.9/cmake-3.27.9.tar.gz
version_holder="#version#"
custom_url="https://github.com/Kitware/CMake/releases/download/v#version#/cmake-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
