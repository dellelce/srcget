# vim:syntax=sh

latest="firstaftermatchword-trim"
opt_match="The latest MPlayer release"
srcurl="http://www.mplayerhq.hu/design7/dload.html"
comment="Movie player"
extension_input="tar.xz"
#http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.4.tar.xz
basename="mplayer"
version_holder="#version#"
custom_url="http://www.mplayerhq.hu/MPlayer/releases/MPlayer-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"


## EOF ##
