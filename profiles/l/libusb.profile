# vim:syntax=sh

basename="libusb"
latest="github"
baseurl="https://github.com/libusb/libusb"
srcurl="${baseurl}/releases"
extension_input="tar.bz2"
version_holder="#version#"
#https://github.com/libusb/libusb/releases/download/v1.0.26/libusb-1.0.26.tar.bz2
custom_url="${baseurl}/releases/download/v#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
