# vim:syntax=sh

#https://ftp.drupal.org/files/projects/drupal-8.1.1.tar.gz
latest="drupal"
srcurl="https://drupal.org/project/drupal"
extension_input="tar.gz"
baseurl="https://ftp.drupal.org/files/projects/drupal-"
custom_url_prefix="${baseurl}"
custom_url_postfix=".${extension_input}"
custom_file_prefix="drupal-"
custom_file_postfix=".${extension_input}"
sep='"'

### EOF ###
