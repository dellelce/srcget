# vim:syntax=sh

srcurl="https://sourceforge.net/projects/expat/files/expat/"
extension_input="tar.bz2"
latest="firstaftermatchword-trim"
opt_match="Parent folder"
opt_nonmatch="svg"
basename="expat"
#
#https://sourceforge.net/projects/expat/files/expat/2.2.9/expat-2.2.9.tar.xz/download
version_holder="#version#"
custom_url="https://sourceforge.net/projects/expat/files/expat/#version#/expat-#version#.${extension_input}/download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
