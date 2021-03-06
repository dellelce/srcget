# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.gaia-gis.it/fossil/freexl/index"
opt_match="current version"
opt_nonmatch=""
basename="freexl"
extension_input="tar.gz"
comment="Library to extract valid data from within an Excel (.xls) spreadsheet"
version_holder="#version#"
minor_holder="#minor#"
major_holder="#major#"
custom_url="http://www.gaia-gis.it/gaia-sins/freexl-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
