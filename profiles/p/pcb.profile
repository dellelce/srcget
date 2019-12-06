# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://sourceforge.net/projects/pcb/files/pcb/"
opt_match="Parent folder"
opt_nonmatch="svg"
basename="pcb"
extension_input="tar.gz"
comment="Printed Circuit Board Layout Tool"
custom_url_prefix="https://datapacket.dl.sourceforge.net/project/pcb/pcb/pcb-"
custom_url_postfix=".${extension_input}"
version_holder="#version#"
#https://sourceforge.net/projects/pcb/files/pcb/pcb-4.2.0/pcb-4.2.0.tar.gz/download
custom_url="https://sourceforge.net/projects/pcb/files/pcb/pcb-#version#/pcb-#version#.${extension_input}/download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
