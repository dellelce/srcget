# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="http://www.openscenegraph.org/index.php/download-section/stable-releases"
opt_match="Github tag for"
opt_nonmatch=""
basename="openscenegraph"
extension_input="tar.gz"
comment=""
version_holder="#version#"
custom_url="https://github.com/openscenegraph/OpenSceneGraph/archive/OpenSceneGraph-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
