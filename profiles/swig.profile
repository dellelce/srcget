# vim:syntax=sh

filter="awk/swigvers.awk"
srcurl="http://sourceforge.net/projects/swig/files/"
extension_input="tar.gz"
# if set will be used to generate url
sep='/'
comment="when will people stop using sourceforge?"
#http://kent.dl.sourceforge.net/project/swig/swig/swig-3.0.0/swig-3.0.0.tar.gz
custom_url_prefix="http://kent.dl.sourceforge.net/project/swig/swig/swig-"
custom_url_postfix=".${extension_input}"
custom_file_postfix=".${extension_input}"

