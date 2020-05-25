# vim:syntax=sh

latest="firstaftermatchword-trim"
basename="gnuplot"
srcurl="https://sourceforge.net/projects/gnuplot/files/"
opt_match="with-sub-label"
extension_input="tar.gz"
version_holder="#version#"
#https://sourceforge.net/projects/gnuplot/files/gnuplot/5.2.8/gnuplot-5.2.8.tar.gz/download
custom_url="https://sourceforge.net/projects/gnuplot/files/gnuplot/#version#/gnuplot-#version#.${extension_input}/download"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
