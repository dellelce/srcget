# vim:syntax=sh
latest="postgresql"
srcurl="https://www.postgresql.org/ftp/source/"
baseurl="https://ftp.postgresql.org/pub/source"
extension_input="tar.bz2"
opt_match="v10"
custom_url_prefix="${baseurl}/"
custom_url_postfix=".${extension_input}"
custom_file_postfix=".${extension_input}"
custom_file_prefix=""
sep='"'
