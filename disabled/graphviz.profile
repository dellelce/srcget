# vim:syntax=sh

latest="firstinbody"
srcurl="https://graphviz.gitlab.io/_pages/Download/Download_source.html"
comment=""
extension_input="tar.gz"
extension_output="tar.bz2" # when you can have something better....
baseurl="https://gitlab.com/graphviz/graphviz/-/archive"
# https://gitlab.com/graphviz/graphviz/-/archive/stable_release_2.40.1/graphviz-stable_release_2.40.1.tar.bz2
version_holder="#version#"
type="stable_release"
basename="graphviz"
custom_url="${baseurl}/${type}_#version#/graphviz-${type}_#version#.${extension_output}"
custom_file="#version#"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_output}"
