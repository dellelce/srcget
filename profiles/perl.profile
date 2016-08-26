# vim:syntax=sh

filter="awk/perl.latest.awk"
srcurl="https://www.perl.org/get.html"
baseurl="http://www.cpan.org/src/5.0"
comment=""
extension_input="tar.gz"
sep='"'
basename="perl"
# http://www.cpan.org/src/5.0/perl-5.24.0.tar.gz 
custom_url_prefix="${baseurl}/${basename}-"
custom_url_postfix=".${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
