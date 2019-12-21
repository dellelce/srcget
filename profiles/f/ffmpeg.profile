# vim:syntax=sh

latest="firstaftermatchword-trim"
srcurl="https://www.ffmpeg.org/download.html"
opt_match="btn-download-wrapper"
opt_nonmatch=""
basename="ffmpeg"
extension_input="tar.bz2"
comment=""
version_holder="#version#"
custom_url="https://ffmpeg.org/releases/ffmpeg-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
