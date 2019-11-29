# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="official Wayland"
opt_nonmatch="released"  # this skips the first version....
srcurl="https://wayland.freedesktop.org/releases.html"
comment=""
extension_input="tar.xz"
basename="wayland"
version_holder="#version#"
#https://wayland.freedesktop.org/releases/wayland-1.17.0.tar.xz
custom_url="https://wayland.freedesktop.org/releases/wayland-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
