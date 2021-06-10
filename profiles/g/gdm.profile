# vim:syntax=sh

latest="gnomejson"
pkgprofile="gdm"
basename="${pkgprofile}"
baseurl="https://download.gnome.org/sources/${pkgprofile}"
srcurl="${baseurl}/cache.json"
extension_input="tar.xz"
comment=""
version_holder="#version#"
major_holder="#major#"
custom_url="https://download.gnome.org/sources/${basename}/#major#/${basename}-#version#.${extension_input}"
