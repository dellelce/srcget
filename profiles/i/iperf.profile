# vim:syntax=sh

basename="iperf"
latest="github"
baseurl="https://github.com/esnet/iperf"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
version_holder="#version#"
#https://github.com/esnet/iperf/releases/download/3.16/iperf-3.16.tar.gz
custom_url="${baseurl}/releases/download/#version#/iperf-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
