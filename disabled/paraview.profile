# vim:syntax=sh

srcurl="https://www.paraview.org/download/"
extension_input="tar.xz"
latest="firstaftermatchword-trim"
opt_match="Source code of the ParaView suite of tools."
basename="paraview"
#
#
version_holder="#version#"
custom_url="https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.7&type=source&os=Sources&downloadFile=ParaView-v#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
