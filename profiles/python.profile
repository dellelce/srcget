# vim:syntax=sh

filter="awk/pythonvers.awk"
srcurl="http://www.python.org/download/releases/"
#http://www.python.org/ftp/python/3.3.3/Python-3.3.3.tar.xz
extension_input="tar.xz"
custom_url_prefix="http://www.python.org/ftp/python/"
custom_url_postfix=".${extension_input}"
custom_file_postfix=".${extension_input}"
basename="Python"
sep='"'
