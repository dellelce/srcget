# vim:syntax=sh

latest="gnomejson"
pkgprofile="geary"
baseurl="https://download.gnome.org/sources/${pkgprofile}"
srcurl="${baseurl}/cache.json"
extension_input="tar.xz"
comment="Open source email client"
# this is like this only for new-styled version 40.0
# https://download.gnome.org/sources/geary/40/geary-40.0.tar.xz
version_holder="#version#"
major_holder="#major#"
custom_url="https://download.gnome.org/sources/geary/#major#/geary-#version#.${extension_input}"

