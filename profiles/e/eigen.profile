# vim:syntax=sh

latest="firstaftermatchword"
srcurl="http://eigen.tuxfamily.org/index.php?title=Main_Page"
extension_input="tar.bz2"
sep='"'
#http://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2
opt_match="latest stable release"
basename="eigen"
version_holder="#version#"
custom_url="https://gitlab.com/libeigen/eigen/-/archive/#version#/eigen-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
