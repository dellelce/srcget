# vim:syntax=sh

latest="firstaftermatchword-single"
srcurl="https://www.iana.org/time-zones"
extension_input="tar.lz"
sep='"'
opt_match="Released"
version_holder="#version#"
basename="tz"
#https://data.iana.org/time-zones/releases/tzdb-2019c.tar.lz
custom_url="https://data.iana.org/time-zones/releases/tzdb-#version#.${extension_input}"
custom_file_prefix="${basename}-"
custom_file_postfix=".${extension_input}"
comment="Time Zones database"


## EOF ##
