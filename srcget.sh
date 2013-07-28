#!/bin/bash
#
# File:         srcget.sh
# Created:      0322 210713
# Description:  description for srcget.sh
#

### ENV ###

# temporary srcHome....
srcHome="/home/antonio/src/utils/srcget"
profilesDir="$srcHome/profiles"
wgetArgs="-q"

### FUNCTIONS ###

# interface to wget

rawget()
{
 typeset url="$1"
 typeset ua="Mozilla/5.0"

 [ -z "$url" ] && return 1

 wget -U "$ua" -O - "${wgetArgs}" "$url"
}

# latest version

current_version()
{
 [ -z "$skipvers" ] && 
 {
   typeset _awk="awk"
 } ||
 {
   typeset _awk="awk -vskipvers=$skipvers"
 }
 
 [ -z "$sep" ] &&
 {
   rawget "$srcurl" | ${_awk} -f "$fp_filter";
 } ||
 {
   rawget "$srcurl" | ${_awk} -F"${sep}" -f "$fp_filter"
 }
}

# main

main()
{
 typeset profile="$1"

 [ -z "$profile" ] && return 1;

 typeset pfp="$profilesDir/${profile}.profile"

 [ ! -f "$pfp" ] && { echo "cannot find profile: $profile [$pfp]"; return 2; }

 . $pfp
 fp_filter="$srcHome/$filter"

 [ -z "srcurl" ] && { echo "invalid url: $srcurl"; return 3; }  

 typeset latest=$(current_version)
 typeset fn=$(basename $latest)
 typeset fullurl

 [ -z "$baseurl" ] &&
 {
   fullurl="$latest"
 } || 
 {
   fullurl="$baseurl/$latest"
 }

cat << EOF
Profile            : $pfp
Current version is : $latest
Full url:          : $fullurl
Filename           : $fn
EOF

 [ ! -f "$fn" ] && 
 {
  wget -q "$fullurl"
  return $?
 } ||
 { 
  echo "File $fn exists"
 }
}

### MAIN ###

main $*

### EOF ###
