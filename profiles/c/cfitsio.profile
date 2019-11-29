# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="Latest News"
srcurl="https://heasarc.gsfc.nasa.gov/fitsio"
comment="Library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format"
extension_input="tar.gz"
basename="cfitsio"
version_holder="#version#"
#http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-3.47.tar.gz
custom_url="http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
