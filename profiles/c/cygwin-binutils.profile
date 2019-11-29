# vim:syntax=sh

#ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/cygwin/x86_64/release/binutils/binutils-2.31.1-1-src.tar.xz 
basemirror="https://ftp.mirrorservice.org"
latest="lastinbody"
srcurl="${basemirror}/sites/sourceware.org/pub/cygwin/x86_64/release/binutils"
baseurl="${srcurl}"
extension_input="tar.xz"
pkgprofile="-src"
basename="cygwin"
custom_file_prefix="${basename}-"
