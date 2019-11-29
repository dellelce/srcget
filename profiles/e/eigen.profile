# vim:syntax=sh

latest="firstaftermatchword"
srcurl="http://eigen.tuxfamily.org/index.php?title=Main_Page"
extension_input="tar.bz2"
sep='"'
#http://bitbucket.org/eigen/eigen/get/3.3.7.tar.bz2
opt_match="latest stable release"
baseurl="http://bitbucket.org/eigen/eigen/get/"
basename="eigen"
custom_url_prefix="${baseurl}"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
