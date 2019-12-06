# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://computing.llnl.gov/projects/sundials/sundials-software"
opt_match="Software Releases"
basename="sundials"
extension_input="tar.gz"
comment=""
version_holder="#version#"
#https://computing.llnl.gov/projects/sundials/download/sundials-5.0.0.tar.gz
custom_url="https://computing.llnl.gov/projects/sundials/download/sundials-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
