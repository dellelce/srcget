# vim:syntax=sh

latest="github"
baseurl="https://github.com/tesseract-ocr/tesseract"
srcurl="${baseurl}/releases"
extension_input="tar.gz"
sep='"'
# https://github.com/tesseract-ocr/tesseract/archive/refs/tags/5.3.2.tar.gz
custom_url_prefix="${baseurl}/archive/refs/tags/"
custom_url_postfix=".${extension_input}"
basename="tesseract"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
