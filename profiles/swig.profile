# vim:syntax=sh

latest="awk/swig.latest.awk"
srcurl="http://sourceforge.net/projects/swig/files/swig/"
extension_input="tar.gz"
#https://netcologne.dl.sourceforge.net/project/swig/swig/5.0.5/swig-5.0.5.tar.gz
# /swig/swig-3.0.12/swig-3.0.12.tar.gz
custom_url_prefix="https://netix.dl.sourceforge.net/project/swig/"
ts="$(date +%s)"
custom_url_postfix=".${extension_input};r=&ts=${ts}&use_mirror=netix"
custom_file_postfix=".${extension_input}"
