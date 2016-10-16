# vim:syntax=sh

latest="awk/bind.latest.awk"
srcurl="http://www.isc.org/downloads/"
baseurl="${srcurl}"
comment=""
extension_input="tar.gz"
sep='"'
basename="bind"
# https://www.isc.org/downloads/file/bind-9-10-4-p1/?version=tar-gz
custom_url_prefix="${baseurl}file/${basename}-"
custom_url_postfix="/?=version=${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
