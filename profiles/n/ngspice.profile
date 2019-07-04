# vim:syntax=sh

latest="firstaftermatchword-single"
srcurl="http://ngspice.sourceforge.net/download.html"
extension_input="tar.gz"
sep='"'
opt_match="Binary packages are"
version_holder="#version#"
#https://sourceforge.net/projects/ngspice/files/latest/download
basename="ngspice"
#https://sourceforge.net/projects/ngspice/files/ng-spirce-rework/30/ngspice-30.tgz/download
#https://sourceforge.net/projects/ngspice/files/ng-spice-rework/30/ngspice-30.tgz/download
#https://sourceforge.net/projects/ngspice/files/ng-spice-rework/30/ngspice-30.tar.gz/download

custom_url="https://sourceforge.net/projects/ngspice/files/ng-spice-rework/#version#/ngspice-#version#.${extension_input}/download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"

## EOF ##
