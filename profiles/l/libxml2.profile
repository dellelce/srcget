# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="libxml2"
baseurl="https://gitlab.gnome.org/GNOME/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.xz"
sep='"'
opt_match="Release "
version_holder="#version#"
major_holder="#major#"
minor_holder="#minor#"
custom_url="https://download.gnome.org/sources/${basename}/#major#.#minor#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
