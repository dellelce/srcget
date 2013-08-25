# vim:syntax=sh


#http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/4.4.0/solr-4.4.0-src.tgz
filter="awk/solrvers.awk"
srcurl="http://lucene.apache.org/solr/"
extension="tgz"
# if set will be used to generate url
custom_url_prefix="http://www.mirrorservice.org/sites/ftp.apache.org/lucene/solr/"
custom_url_postfix="-src.${extension}"
custom_file_prefix=""
custom_file_postfix="-src.${extension}"
