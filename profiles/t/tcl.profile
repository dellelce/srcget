# vim:syntax=sh
#

basename="tcl"
latest="firstaftermatchword"
opt_match="id=\"downloads\""
srcurl="http://www.tcl.tk/software/tcltk/download.html"
extension_url="tar.gz"
version_holder="#version#"
#https://downloads.sourceforge.net/project/tcl/Tcl/8.6.13/tcl8.6.13-src.tar.gz
custom_url="https://downloads.sourceforge.net/project/tcl/Tcl/#version#/tcl#version#-src.tar.gz"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_url}"
