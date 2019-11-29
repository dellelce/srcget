# vim:syntax=sh

latest="firstaftermatchword-underscorevers"
basename="gegl"
baseurl="https://gitlab.gnome.org/GNOME/${basename}"
srcurl="${baseurl}/-/tags"
extension_input="tar.bz2"
sep='"'
opt_match="row-main-content"
version_holder="#version#"
# https://gitlab.gnome.org/GNOME/gegl/-/archive/GEGL_0_4_16/gegl-GEGL_0_4_16.tar.bz2
custom_url="${baseurl}/-/archive/#version#/${basename}-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment="image processing library used by gimp and several gnome projects"

## EOF ##
